var find_root_node = null;
var highlights = [];
var find_pointer = -1;
var find_text = '';
var found_highlight_rule = 0;
var found_selected_rule = 0;

function findit() 
{
	// put the value of the textbox in string
	var string = document.getElementById('fwtext').value;
		
	// if the text has not been changed and we have previous finds
	if (find_text.toLowerCase() == document.getElementById('fwtext').value.toLowerCase() &&
		find_pointer >= 0) 
	{	
		findnext(); // Find the next occurrence
	}
	else
	{
		unhighlight(); // Remove highlights of any previous finds
		
		if (string == '') // if empty string
		{
			find_msg.innerHTML = "";
			return;
		}
		
		find_text = string;
		
		// Ver 5.0a - 7/18/2014. Next four lines because find_root_node won't exist until doc loads
		if (find_root_node != null)
			var node = document.getElementById(find_root_node);
		else
			var node = null;
		
		highlight(string, document.getElementById('content')); // highlight all occurrences of search string
		
		if (highlights.length > 0) // if we found occurences
		{
			find_pointer = -1;
			findnext(); // Find first occurrence
		}
		else
		{
			find_msg.innerHTML = "&nbsp;<b>0 of 0</b>"; // ver 5.1 - 10/17/2014 - changed from "Not Found"
			find_pointer = -1;	
		}
	}
	
}  // end function findit()

function findnext()
{
	var current_find;
	
	if (find_pointer != -1) // if not first find
	{
		current_find = highlights[find_pointer];
		
		// Turn current find back to yellow
		if (found_highlight_rule == 1)
			current_find.className = "highlight";
		else 
			current_find.style.backgroundColor = "yellow";
	}	
	
	find_pointer++;
	
	if (find_pointer >= highlights.length) // if we reached the end
			find_pointer = 0; // go back to first find
	
	var display_find = find_pointer+1;
	
	find_msg.innerHTML = display_find+" of "+highlights.length;
	
	current_find = highlights[find_pointer];
	
	// Turn selected find orange or add .find_selected css class to it
	if (found_selected_rule == 1)
			current_find.className = "find_selected";
		else 
			current_find.style.backgroundColor = "orange";
			
	//highlights[find_pointer].scrollIntoView(); // Scroll to selected element
	scrollToPosition(highlights[find_pointer]);
	
} // end findnext()

// This function is to find backwards by pressing the Prev button

function findprev()
{
	// put the value of the textbox in string
	var string = document.getElementById('fwtext').value;
		
	// if the text has not been changed and we have previous finds
	if (find_text.toLowerCase() == document.getElementById('fwtext').value.toLowerCase() &&
		find_pointer >= 0) 
	{	
		var current_find;
		
		if (highlights.length < 1) return;
		
		if (find_pointer != -1) // if not first find
		{
			current_find = highlights[find_pointer];
			
			// Turn current find back to yellow
			if (found_highlight_rule == 1)
				current_find.className = "highlight";
			else 
				current_find.style.backgroundColor = "yellow";
		}	
		
		find_pointer--;
		
		if (find_pointer < 0) // if we reached the beginning
				find_pointer = highlights.length-1; // go back to last find
		
		var display_find = find_pointer+1;
		
		find_msg.innerHTML = display_find+" of "+highlights.length;
		
		current_find = highlights[find_pointer];
		
		// Turn selected find orange or add .find_selected css class to it
		if (found_selected_rule == 1)
				current_find.className = "find_selected";
			else 
				current_find.style.backgroundColor = "orange";
				
		//highlights[find_pointer].scrollIntoView(); // Scroll to selected element
		scrollToPosition(highlights[find_pointer]);
	}
	else
	{
		unhighlight(); // Remove highlights of any previous finds
		
		if (string == '') // if empty string
		{
			find_msg.innerHTML = "";
			return;
		}
		
		find_text = string;
		
		// Ver 5.0a - 7/18/2014. Next four lines because find_root_node won't exist until doc loads
		if (find_root_node != null)
			var node = document.getElementById(find_root_node);
		else
			var node = null;
		
		highlight(string, document.getElementById('content')); // highlight all occurrences of search string
		
		if (highlights.length > 0) // if we found occurences
		{
			find_pointer = -1;
			findnext(); // Find first occurrence
		}
		else
		{
			find_msg.innerHTML = "&nbsp;<b>0 of 0</b>"; // ver 5.1 - 10/17/2014 - changed from "Not Found"
			find_pointer = -1;	
		}
	}
	
} // end findprev()

function unhighlight()
{
	for (var i = 0; i < highlights.length; i++)
	{
		
		var the_text_node = highlights[i].firstChild; // firstChild is the textnode in the highlighted span
	
		var parent_node = highlights[i].parentNode; // the parent element of the highlighted span
		
		// First replace each span with its text node nodeValue
		if (highlights[i].parentNode)
		{
			highlights[i].parentNode.replaceChild(the_text_node, highlights[i]);
			if (i == find_pointer) selectElementContents(the_text_node); // ver 5.1 - 10/17/2014 - select current find
			parent_node.normalize(); // The normalize() method removes empty Text nodes, and joins adjacent Text nodes in an element
			normalize(parent_node);	// Ver 5.2 - 3/10/2015 - normalize() is incorrect in IE. It will combine text nodes but may leave empty text nodes. So added normalize(node) function below		
		}
	}
	// Now reset highlights array
	highlights = [];
	find_pointer = -1; // ver 5.1 - 10/17/2014
} // end function unhighlight()

function highlight(word, node)
{
	if (!node)
		node = document.body;
	
	//var re = new RegExp(word, "i"); // regular expression of the search term // Ver 5.3c - Not using regular expressions search now
	
	for (node=node.firstChild; node; node=node.nextSibling)
	{	
		//console.log(node.nodeName);
		if (node.nodeType == 3) // text node
		{
			var n = node;
			//console.log(n.nodeValue);
			var match_pos = 0;
			//for (match_pos; match_pos > -1; n=after)
			{	
				//match_pos = n.nodeValue.search(re); // Ver 5.3b - Now NOT using regular expression because couldn't search for $ or ^
				match_pos = n.nodeValue.toLowerCase().indexOf(word.toLowerCase()); // Ver 5.3b - Using toLowerCase().indexOf instead
				
				if (match_pos > -1) // if we found a match
				{
					var before = n.nodeValue.substr(0, match_pos); // split into a part before the match
					var middle = n.nodeValue.substr(match_pos, word.length); // the matched word to preserve case
					//var after = n.splitText(match_pos+word.length);		
					var after = document.createTextNode(n.nodeValue.substr(match_pos+word.length)); // and the part after the match	
					
					/*alert(before+"///"+middle+"///"+after);*/
					var highlight_span = document.createElement("span"); // create a span in the middle
			        if (found_highlight_rule == 1)
						highlight_span.className = "highlight";
					else 
						highlight_span.style.backgroundColor = "yellow";	
			        
					highlight_span.appendChild(document.createTextNode(middle)); // insert word as textNode in new span
					n.nodeValue = before; // Turn node data into before
					n.parentNode.insertBefore(after, n.nextSibling); // insert after
		            n.parentNode.insertBefore(highlight_span, n.nextSibling); // insert new span
		           	highlights.push(highlight_span); // add new span to highlights array
		           	highlight_span.id = "highlight_span"+highlights.length;
					node=node.nextSibling; // Advance to next node or we get stuck in a loop because we created a span (child)
				}
			}
		}
		else // if not text node then it must be another element
		{
			// nodeType 1 = element
			if (node.nodeType == 1 && node.nodeName.match(/textarea/i) && !getStyle(node, "display").match(/none/i)) 
				textarea2pre(node);
			else
			{
			if (node.nodeType == 1 && !getStyle(node, "visibility").match(/hidden/i)) // Dont search in hidden elements
			if (node.nodeType == 1 && !getStyle(node, "display").match(/none/i)) // Dont search in display:none elements
			highlight(word, node);
			}
		}
	}
	

} // end function highlight(word, node)

/* It is not possible to get certain styles set in css such as display using 
the normal javascript.  So we have to use this function taken from:
http://www.quirksmode.org/dom/getstyles.html */
function getStyle(el,styleProp)
{
	// if el is a string of the id or the actual object of the element
	var x = (document.getElementById(el)) ? document.getElementById(el) : el;
	if (x.currentStyle) // IE
		var y = x.currentStyle[styleProp];
	else if (window.getComputedStyle)  // FF
		var y = document.defaultView.getComputedStyle(x,null).getPropertyValue(styleProp);
	return y;
}

function scrollToPosition(field)
{  
   // This function scrolls to the DIV called 'edited'
   // It is called with onload.  'edited' only exists if
   // they just edited a comment or the last comment
   // if they just sent a comment
	var scrollLeft = document.body.scrollLeft || document.documentElement.scrollLeft;
	var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
	var scrollBottom = (window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight) + scrollTop;
	var scrollRight = (window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth) + scrollLeft;

   
   if (field)
   {
	   var theElement = field;  
	   var elemPosX = theElement.offsetLeft;  
	   var elemPosY = theElement.offsetTop;  
	   theElement = theElement.offsetParent;  
	   	while(theElement != null)
	   	{  
			elemPosX += theElement.offsetLeft   
			elemPosY += theElement.offsetTop;  
			theElement = theElement.offsetParent; 
		} 
		// Only scroll to element if it is out of the current screen
		if (elemPosX < scrollLeft || elemPosX > scrollRight ||
			elemPosY < scrollTop || elemPosY > scrollBottom) 
		//window.scrollTo(elemPosX ,elemPosY); 
		field.scrollIntoView();
	}
}  // end function scrollToPosition()

// ver 5.1 - 10/17/2014
function selectElementContents(el) 
{
    /* http://stackoverflow.com/questions/8019534/how-can-i-use-javascript-to-select-text-in-a-pre-node-block */
	if (window.getSelection && document.createRange) {
        // IE 9 and non-IE
        var range = document.createRange();
        range.selectNodeContents(el);
        var sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
    } else if (document.body.createTextRange) {
        // IE < 9
        var textRange = document.body.createTextRange();
        textRange.moveToElementText(el);
        textRange.select();
        //textRange.execCommand("Copy");
    }
} // end function selectElementContents(el)

function normalize(node) {
	//http://stackoverflow.com/questions/22337498/why-does-ie11-handle-node-normalize-incorrectly-for-the-minus-symbol
	  if (!node) { return; }
	  if (node.nodeType == 3) {
	    while (node.nextSibling && node.nextSibling.nodeType == 3) {
	      node.nodeValue += node.nextSibling.nodeValue;
	      node.parentNode.removeChild(node.nextSibling);
	    }
	  } else {
	    normalize(node.firstChild);
	  }
	  normalize(node.nextSibling);
	}
