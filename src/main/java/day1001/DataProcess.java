package day1001;

import java.util.ArrayList;
import java.util.List;

public class DataProcess {

	public List<ImgVO> searchData() {
		List<ImgVO> list = new ArrayList<ImgVO>();

		list.add(new ImgVO("dog.png",
				"개(영어: Dog, 학명: Canis lupus familiaris)는 중형 동물이자 가장 널리 분포하며 개체 수가 가장 많은 지상 동물 중 하나이며 가축화한 회색늑대이다.[1][2][3][4][5] 개는 인류가 최초로 가축으로 삼은 동물로 알려져 있으며[6], 역사적으로 반려견, 사냥견으로서 길러 왔다."));
		list.add(new ImgVO("dragon.png",
				"용(문화어: 룡, 龍, dragon)은 동아시아의 신화 및 전설에 등장하는 상상의 동물로 여겨 지지만 수 많은 역사 기록에 남아 있는 생물이다. 특히 중국에서는 신성한 동물, 즉 영수(靈獸)라고 하여 매우 귀하게 여겼다. 용은 영수 중에서도 특히 귀하게 여겨져, 용이 모습을 드러내면 세상이 크게 변할 전조라고 믿어졌다. "));
		list.add(new ImgVO("horse.png",
				"말(馬, horse)은 말목 말과의 동물이다. 학명은 Equus caballus[1]이며, 조상은 지금으로부터 4,500-5,500만 년 전에 존재했던 에오히푸스이다. 가축으로 길들여진 이래로 사람들과 친숙하게 지내온 동물 중 하나로 사람을 위해 많이 봉사해 왔다. "));
		list.add(new ImgVO("monkey.png",
				"원숭이(猿-, Simius) 또는 잔나비는 영장류에 속하는 동물의 총칭이다. 원숭이하목은 크게 \"신세계원숭이\", \"구세계원숭이\", \"유인원\"으로 나뉜다. 신세계원숭이는 광비원소목을 이루지만, 구세계원숭이는 협비원소목의 한 상과에 그친다"));
		return list;
	}

}
