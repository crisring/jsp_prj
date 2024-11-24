package day1105;

import java.io.File;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class SimpleParsing {

	public static void main(String[] args) {

		// 1. 파서 생성
		SAXBuilder builder = new SAXBuilder();
		try {
			// 2. XML문서객체 얻기
			Document xmlDoc = builder.build(new File("C:/dev/workspace/jsp_prj/src//main/webapp/day1105/parsing.xml"));

			// 3. 최상위 부모노드 얻기
			Element namesNode = xmlDoc.getRootElement();

			// 4. 파싱할 자식 노드 얻기
			Element nameNode = namesNode.getChild("name");

			// 5. 파싱
			String name = nameNode.getValue();
			System.out.println(name);

		} catch (IOException ie) {
			ie.printStackTrace();
		} catch (JDOMException je) {
			je.printStackTrace();
		}
	}// main
}// class
