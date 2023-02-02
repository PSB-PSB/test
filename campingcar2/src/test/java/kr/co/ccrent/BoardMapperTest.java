package kr.co.ccrent;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.domain.BoardVO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.mapper.BoardMapper;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {
	
	@Autowired
	private BoardMapper boardMapper;
	
	// @Test
	public void selectAllTest() {
		List<BoardVO> volist = boardMapper.selectAll("write_free");
		volist.forEach(vo -> System.out.println(vo));
	}
	
	// @Test
	public void selectListTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
				.bo_table("write_free")
				.page(1)
				.size(10)
				.build();
		List<BoardVO> volist = boardMapper.selectList(pageRequestDTO);
		volist.forEach(vo -> System.out.println(vo));
	}
	
	// @Test
	public void selectMaxIdTest() {
		System.out.println(boardMapper.selectMaxId("write_free"));
	}
	
	@Test
	public void insertTest() {
		BoardVO boardVO = BoardVO.builder()
				.bo_table("free")
				.wr_num(400)
				.wr_reply("A")
				.wr_parent(400)
				.wr_is_comment(0)
				.ca_name("일반")
				.wr_subject("인서트 테스트")
				.wr_content("인서트 테스트")
				.wr_link1("")
				.wr_link2("")
				.mb_id("user00")
				.wr_name("user00")
				.wr_password("0000")
				.wr_ip("")
				.build();
		boardMapper.insert(boardVO);

	}
}
