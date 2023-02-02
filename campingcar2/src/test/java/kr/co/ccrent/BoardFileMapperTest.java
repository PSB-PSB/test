package kr.co.ccrent;

import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.domain.BoardFileVO;
import kr.co.ccrent.mapper.BoardFileMapper;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardFileMapperTest {
	
	@Autowired
	private BoardFileMapper boardFileMapper;
	
	@Test
	public void selectTimeTest() {
		System.out.println(boardFileMapper.selectTime());
	}
	
	// @Test
	public void insertTest() {
		BoardFileVO boardFileVO = BoardFileVO.builder()
			.bo_table("free")
			.wr_id(100)
			.bf_no(0)
			.bf_file("01.jpg")
			.bf_source("01.jpg")
			.build();
		boardFileMapper.insert(boardFileVO);
	}
	
	@Test
	public void selectByKeyTest() {
		HashMap<String, Object> fieldmap = new HashMap<>();
		fieldmap.put("bo_table", "free");
		fieldmap.put("wr_id", 447);
		List<BoardFileVO> volist = boardFileMapper.selectByKey(fieldmap);
		volist.forEach(vo -> System.out.println(vo));
	}
}
