package day1105;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateXml2 {

	public static void main(String[] args) {

		// 1. XML문서 객체 생성
		Document doc = new Document();

		// 2. 최상위 부모노드 생성
		Element rootNode2 = new Element("depts");

		// 첫 번째 부서 생성
		Element deptNode1 = new Element("dept");
		Element deptnoNode1 = new Element("deptno");
		deptnoNode1.setText("10");
		Element dnameNode1 = new Element("dname");
		dnameNode1.setText("개발부");
		Element locNode1 = new Element("loc");
		locNode1.setText("서울");

		// 첫 번째 부서에 자식 노드 추가
		deptNode1.addContent(deptnoNode1);
		deptNode1.addContent(dnameNode1);
		deptNode1.addContent(locNode1);

		// 두 번째 부서 생성
		Element deptNode2 = new Element("dept");
		Element deptnoNode2 = new Element("deptno");
		deptnoNode2.setText("20");
		Element dnameNode2 = new Element("dname");
		dnameNode2.setText("유지보수");
		Element locNode2 = new Element("loc");
		locNode2.setText("서울");

		// 두 번째 부서에 자식 노드 추가
		deptNode2.addContent(deptnoNode2);
		deptNode2.addContent(dnameNode2);
		deptNode2.addContent(locNode2);

		// 세 번째 부서 생성
		Element deptNode3 = new Element("dept");
		Element deptnoNode3 = new Element("deptno");
		deptnoNode3.setText("30");
		Element dnameNode3 = new Element("dname");
		dnameNode3.setText("영업부");
		Element locNode3 = new Element("loc");
		locNode3.setText("서울");

		// 세 번째 부서에 자식 노드 추가
		deptNode3.addContent(deptnoNode3);
		deptNode3.addContent(dnameNode3);
		deptNode3.addContent(locNode3);

		// 모든 부서 노드를 최상위 노드에 추가
		rootNode2.addContent(deptNode1);
		rootNode2.addContent(deptNode2);
		rootNode2.addContent(deptNode3);

		// 6. 최상위 부모노드를 문서노드에 배치
		doc.addContent(rootNode2);

		// 6. 생성된 문서 객체를 출력
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		try {
			// File file = new
			// File("C:/dev/workspace/jsp_prj/src/main/java/day1105/msg.xml");
			File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/day1105/dept.xml");

			FileOutputStream fos = new FileOutputStream(file);

			xOut.output(doc, fos);
			if (fos != null) {
				fos.close();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
