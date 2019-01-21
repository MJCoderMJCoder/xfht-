package com.cxgc.front.util;

import java.io.File;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

/**
 * bean与XML互转（基于Xstream注解）
 * 
 * @author kongxiangming
 *
 */
public class XmlUtil {

	/**
	 * 
	 * xml字符串转为document对象
	 * 
	 * @param xmlConent
	 * @return
	 * @throws DocumentException
	 */
	public static Document xmlFromString(String xmlConent) throws DocumentException {
		return DocumentHelper.parseText(xmlConent);
	}

	/**
	 * 装换成xml格式的数据
	 * 
	 * @param desc
	 * @return
	 */
	public static String zhuanXml(String desc) {
		String filecontent = "<?xml version=\"1.0\" encoding=\"utf-8\"?><product><synopsis><![CDATA[" + desc
				+ "]]></synopsis><desc><![CDATA[" + desc + "]]></desc></product>";
		return filecontent;
	}

	/**
	 * 将一个数组转换成xml格式的数据
	 * 
	 * @param desc
	 * @return
	 */
	public static String zhuanXml2(String[] desc) {
		String filecontent = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" + "<product>" + "<synopsis><![CDATA["
				+ desc[0] + "]]></synopsis>" + "<desc><![CDATA[" + desc[1] + "]]></desc>" + "</product>";
		return filecontent;
	}

	/**
	 * 解析xml 并且获取数据
	 * 
	 * @param file
	 * @param element
	 * @return
	 * @throws DocumentException
	 */
	public static String getTxt(File file, String element) {
		String str = null;
		try {
			SAXReader reader = new SAXReader();
			Document doc = reader.read(file);
			Element root = doc.getRootElement(); // 获取根节点
			str = root.elementText(element);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

		}
		return str;
	}

	/**
	 * 解析xml 并且获取数据
	 * 
	 * @param file
	 * @param element
	 * @return
	 * @throws DocumentException
	 */
	public static String[] getTxt2(File file, String[] element) {
		String[] str = null;
		try {
			SAXReader reader = new SAXReader();
			if (file.exists()) {
				Document doc = reader.read(file);
				Element root = doc.getRootElement(); // 获取根节点
				String s1 = root.elementText(element[0]);
				String s2 = root.elementText(element[1]);
				str = new String[] { s1, s2 };
			} else {
				str = new String[] { "", "" };
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		} finally {

		}
		return str;
	}

	public static String zhuanProductXml(String[] strings) {
		String filecontent = "<?xml version=\"1.0\" encoding=\"utf-8\" ?> " + "<product>" + "<notice><![CDATA["
				+ strings[0] + "]]></notice>" + "<info><![CDATA[" + strings[1] + "]]></info>" + "</product>";
		return filecontent;
	}

	/**
	 * 获取node值 Description：
	 * 
	 * @param node
	 * @return
	 */
	public static String getValue(Node node) {
		if (node == null) {
			return null;
		}
		return node.getText();

	}

	/**
	 * 对返回的身份信息进行解析
	 * @param xml
	 * @return
	 */
	public static String getIdentity(String xml) {

		SAXReader reader = new SAXReader();
		Document document = null;
		try {
			document = DocumentHelper.parseText(xml);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		// 获取文档的根节点
		Element root = document.getRootElement();
		String result = null;

		if (root != null) {
			Element contactElem = root.element("body");
			if (contactElem != null) {
				Element element = contactElem.element("attributes");
				if (element != null) {
					List<Element> contactList = element.elements();
					if (contactList != null) {
						for (Element e : contactList) {
							String text = e.getText();
							String[] split = text.split(",");
							String a = split[0];
							if(a!=null){
								a = a.substring(3, a.length());
								return a;
							}
						}
					}
				}
			}
		}
		return result;
	}
	
	/**
	 * 对返回的信息状态进行解析
	 * @param xml
	 * @return
	 */
	public static Boolean getStatus(String xml){
		Boolean flag = false;
		SAXReader reader = new SAXReader();
		Document document = null;
		try {
			document = DocumentHelper.parseText(xml);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		// 获取文档的根节点
		Element root = document.getRootElement();
		String result = null;

		if (root != null) {
			Element contactElem = root.element("body");
			if (contactElem != null) {
				Element element = contactElem.element("authResultSet");
				if (element != null) {
					List<Element> contactList = element.elements();
					for (Element e : contactList) {
						List<Attribute> attributes = e.attributes();
						if (attributes != null && attributes.size() > 0) {
							for (Attribute attr : attributes) {// 遍历当前节点的所有属性
								String name = attr.getName();// 属性名称
								String value = attr.getValue();// 属性的值
								if("success".equals(name) && "true".equals(value)){
									flag=true;
								}
							}
						}
					}
				}
			}
		}
		return flag;
	}
	
	
	/**
	 * 解析xml
	 * @param xml
	 * @return
	 */
	public static String getXmlText(String xml) {

		Document document = null;
		try {
			document = DocumentHelper.parseText(xml);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		// 获取文档的根节点
		Element root = document.getRootElement();

		if (root != null) {
			Element contactElem = root.element("body");
			if (contactElem != null) {
				Element element = contactElem.element("attributes");
				if (element != null) {
					List<Element> contactList = element.elements("attr");
					if(contactList!=null&& contactList.size()>0){
						for (Element e : contactList) {
							String attributeValue = e.attributeValue("name");
							
							if("X509Certificate.SubjectDN".equals(attributeValue)){
								return e.getText();
							}
						}
					}
				}
			}
		}
		return null;
	}
	
	
	
}
