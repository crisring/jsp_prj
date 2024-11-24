package day1105;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateXml {

	public static void main(String[] args) {

		// 1. XML문서 객체 생성
		Document doc = new Document();

		// 2. 최상위 부모노드 생성
		Element rootNode = new Element("root");

		// 3. 첫 번째 자식 노드 생성
		Element msgNode1 = new Element("msg");
		msgNode1.setText("안녕하세요?");

		// 4. 두 번째 자식 노드 생성
		Element msgNode2 = new Element("msg");
		msgNode2.setText("어서오삼");

		// 4. 두 번째 자식 노드 생성
		Element msgNode3 = new Element("msg");
		msgNode2.setText("오늘은 화요일 입니다.");

		// 5. 자식 노드를 부모노드에 배치
		rootNode.addContent(msgNode1);
		rootNode.addContent(msgNode2);
		rootNode.addContent(msgNode3);

		// 6. 최상위 부모노드를 문서노드에 배치
		doc.addContent(rootNode);

		// 6. 생성된 문서 객체를 출력
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		try {
			// File file = new
			// File("C:/dev/workspace/jsp_prj/src/main/java/day1105/msg.xml");
			File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/day1105/msg.xml");

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
