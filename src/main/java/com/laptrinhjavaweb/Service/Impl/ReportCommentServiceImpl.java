package com.laptrinhjavaweb.Service.Impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.DAO.IReportCommentDAO;
import com.laptrinhjavaweb.Service.IReportCommentService;
import com.laptrinhjavaweb.model.ReportCommentModel;

public class ReportCommentServiceImpl implements IReportCommentService{
	
	@Inject
	private IReportCommentDAO iReportCommentDAO;
	
	@Override
	public List<ReportCommentModel> findAll() {
		return iReportCommentDAO.findAll();
	}
	
	@Override
	public ReportCommentModel findOne(int id) {
		return iReportCommentDAO.findOne(id);
	}

	@Override
	public ReportCommentModel save(ReportCommentModel reportComment) {
		Integer id = 0;
		reportComment.setCreateDate(new Timestamp(System.currentTimeMillis()));
		if(reportComment.getID() != null && reportComment.getID() > 0) {
			id = iReportCommentDAO.updateReport(reportComment);
		}else {
			id = iReportCommentDAO.addReport(reportComment);
		}
		if(id != null) {
			return findOne(id);
		}
		return null;
	}

	@Override
	public Integer[] delete(ReportCommentModel reportComment) {
		int n = reportComment.getIds().length;
		Integer[] result = new Integer[n];
		for(int i=0 ; i<n; i++) {
			result[i] = iReportCommentDAO.delete(reportComment.getIds()[i]);
		}
		return result;
	}

	
}
