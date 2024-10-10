package com.example.darkin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.darkin.dto.AnswerDto;
import com.example.darkin.dto.QuestionDto;

@Mapper
public interface BoardMapper {
	
	public List<QuestionDto> questionList();
	public void insertQuestion(QuestionDto questionDto);
	public QuestionDto questionBoard(int id);
	public void writeAnswer(AnswerDto answerDto);
	public List<AnswerDto> answerList(int qid); 

}
