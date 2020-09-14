package com.laptrinhjavaweb.DAO;

import java.util.List;

import com.laptrinhjavaweb.model.ReportCommentModel;

public interface IReportCommentDAO {
	List<ReportCommentModel> findAll();
	ReportCommentModel findOne(int id);
	Integer addReport(ReportCommentModel reportComment);
	Integer updateReport(ReportCommentModel reportComment);
	Integer delete(int id);
}
