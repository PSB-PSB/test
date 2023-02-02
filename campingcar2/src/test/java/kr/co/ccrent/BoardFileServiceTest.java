package kr.co.ccrent;

import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import kr.co.ccrent.dto.BoardFileDTO;
import kr.co.ccrent.service.BoardFileService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardFileServiceTest {
	
	@Autowired
	private BoardFileService boardFileService;
	
	@Test
	public void selectByKeyTest() {
		HashMap<String, Object> fieldmap = new HashMap<>();
		fieldmap.put("bo_table", "free");
		fieldmap.put("wr_id", 447);
		List<BoardFileDTO> dtolist = boardFileService.getFileList(fieldmap);
		dtolist.forEach(dto -> System.out.println(dto));
	}

}
