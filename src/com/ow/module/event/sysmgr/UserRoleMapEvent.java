package com.ow.module.event.sysmgr;

import java.util.HashMap;

import org.apache.log4j.Logger;
import org.apache.tools.ant.taskdefs.condition.HasMethod;

import com.ow.framework.common.Constant;
import com.ow.framework.data.po.ResultData;
import com.ow.framework.exception.DetailException;
import com.ow.framework.listener.event.EventExecutor;
import com.ow.framework.listener.event.EventListener;
import com.ow.framework.util.KeyHelper;
import com.sun.xml.xsom.impl.scd.Iterators.Map;




public class UserRoleMapEvent implements EventListener{

	static Logger log = Logger.getLogger(Constant.FRAMEWORK);
	private ResultData resultData;
	public UserRoleMapEvent()
	{
		resultData = new ResultData();
	}	
	
	public ResultData event(EventExecutor eventExecutor) throws Exception {
		try
		{
			String autoPrimaryKey = KeyHelper.getKey();
			eventExecutor.getBaseAction().getParamMap().put("autoPrimaryKey", autoPrimaryKey);
			
			
			String deletesid = eventExecutor.getSqlidByIndex(0);
			String insertsid = eventExecutor.getSqlidByIndex(1);
			String updateid = eventExecutor.getSqlidByIndex(2);
			if (!"".equals(deletesid))
			{
				eventExecutor.getSqlSession().delete(deletesid, eventExecutor.getBaseAction().getParamMap());
				resultData.setIntResult(1);
			}		
			if (!"".equals(insertsid))
			{
				String pmsArr [] = eventExecutor.getBaseAction().getParamMap().get("treeCheckboxVal") == null ?new String[1]:eventExecutor.getBaseAction().getParamMap().get("treeCheckboxVal").split(",");
				int rvalue = 0;
				for (int i=0; i<pmsArr.length; i++)
				{
					if (pmsArr[i] != null && !pmsArr[i].equals("")){
						pmsArr[i] = pmsArr[i].trim().replaceAll("roleID=", "");
						eventExecutor.getBaseAction().getParamMap().put("urmRoleID", pmsArr[i]);
						eventExecutor.getSqlSession().insert(insertsid, eventExecutor.getBaseAction().getParamMap());
						eventExecutor.getSqlSession().update(updateid, eventExecutor.getBaseAction().getParamMap());
					}
				}
				resultData.setIntResult(1);
			}				
			return resultData;
		}
		catch (Exception e)
		{
			resultData.setIntResult(0);
			String error = DetailException.expDetail(e, RolePermissionMapEvent.class);
			log.error(error);
		}
		return resultData;
	}

}
