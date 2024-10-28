package day1018;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class DataDAO {

	public List<DataVO> selectData() {

		List<DataVO> list = new ArrayList<DataVO>();

		if (new Random().nextBoolean()) {
			list.add(new DataVO("img.png", "3조 조원 이인혁", "모든일에 최선을 다하는 조원 임다.", 1));
			list.add(new DataVO("img2.jpg", "페페", "이게 뭐에요??", 2));
			list.add(new DataVO("img3.jpg", "침흘리는 페페", "침흘림", 3));
			list.add(new DataVO("하울.jpg", "김하울", "귀여운 하울이", 4));
		}
		return list;

	}// selectData

}// class
