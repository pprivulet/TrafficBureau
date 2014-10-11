package com.tb.dao;

import java.util.List;

import com.tb.domain.BaseEntity;

public interface IDao<E extends BaseEntity> {

	/**
	 * 
	 * @param statementName
	 * @param parameterObject
	 */
	Integer delete(String statementName, Object parameterObject);

	/**
	 * 
	 * @param statementName
	 * @param parameterObject
	 * @return
	 */
	List<E> find(String statementName, Object parameterObject);

	/**
	 * 
	 * @param statementName
	 * @param parameterObject
	 * @return
	 */
	E findById(String statementName, Object parameterObject);

	/**
	 * 
	 * @param statementName
	 * @param parameterObject
	 * @return
	 */
	Integer insert(String statementName, Object parameterObject);

	/**
	 * 
	 * @param statementName
	 * @param parameterObject
	 * @return
	 */
	Integer update(String statementName, Object parameterObject);

	/**
	 * 
	 * @param statementName
	 * @param parameterObject
	 * @return
	 */
}
