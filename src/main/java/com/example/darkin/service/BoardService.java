package com.example.darkin.service;

import java.util.List;

import com.example.darkin.dto.AnswerDto;
import com.example.darkin.dto.QuestionDto;

public interface BoardService {
	
	public List<QuestionDto> questionList();
	public void writeQuestion(QuestionDto questionDto);
	public QuestionDto questionBoard(int id);
	public void writeAnswer(AnswerDto answerDto);
	public List<AnswerDto> answerList(int id);

}
