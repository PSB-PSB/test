package kr.co.ccrent;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.domain.BoardVO;
import kr.co.ccrent.dto.BoardDTO;
import kr.co.ccrent.dto.PageRequestDTO;
import kr.co.ccrent.dto.PageResponseDTO;
import kr.co.ccrent.service.BoardService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTest {

	@Autowired
	private BoardService boardService;
	
	// @Test
	public void getAllTest() {
		List<BoardDTO> dtolist = boardService.getAll("write_free");
		dtolist.forEach(dto -> System.out.println(dto));
	}
	
	// @Test
	public void getListTest() {
		PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
				.bo_table("write_free")
				.page(2)
				.size(10)
				.build();
		PageResponseDTO<BoardDTO> responseDTO = boardService.getList(pageRequestDTO);
		System.out.println(responseDTO);
		responseDTO.getDtoList().stream().forEach(dto -> System.out.println(dto));
	}
	
	@Test
	public void registerTest() {
		BoardDTO boardDTO = BoardDTO.builder()
				.bo_table("free")
				.wr_num(401)
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
		// boardService.register(boardDTO);	
		
	}
}
