package com.laptrinhjavaweb.Utils;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class FormUtils {
	@SuppressWarnings("unchecked")
	public static <T> T toModel(Class<T> tclass,HttpServletRequest request) {
		try {
			T model = tclass.newInstance();
			BeanUtils.populate(model, request.getParameterMap());
			return model;
		} catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			return null;
		}
	}
}
