package com.example.darkin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.darkin.dto.AnswerDto;
import com.example.darkin.dto.QuestionDto;
import com.example.darkin.service.BoardService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
	@GetMapping("/community/questionList")
	public String boardList(Model model)
	{
		List<QuestionDto> questionList=boardService.questionList();
		model.addAttribute("questionList", questionList);
		
		return "/community/questionList"; 
	}

	
	
	
	@GetMapping("/community/writeQuestion")
	public String writeQuestionForm()
	{
		return "/community/writeQuestion";
	}
	@PostMapping("/community/writeQuestion")
	public String writeQuestion(HttpSession session , QuestionDto questionDto)
	{
		String username=(String)session.getAttribute("username");
		questionDto.setQuestionUser(username);

	    boardService.writeQuestion(questionDto);
	    
	    return "redirect:/community/questionList";
	}
	
	
	@GetMapping("/community/boardContent")
	public String boardContent(@RequestParam int id , Model model)
	{
	   QuestionDto questionDto = boardService.questionBoard(id);
	   model.addAttribute("question", questionDto);
	   
	   List<AnswerDto> answerDto = boardService.answerList(id);
	   model.addAttribute("answer", answerDto);
	   
	   return "/community/boardContent";
	}
	@PostMapping("/community/writeAnswer")
	public String writeAnswer(AnswerDto answerDto,HttpSession session)
	{
		String username=(String)session.getAttribute("username");
		answerDto.setAnswerUser(username);
		boardService.writeAnswer(answerDto);
		return "redirect:/community/boardContent?id="+answerDto.getQid();
	}
}











