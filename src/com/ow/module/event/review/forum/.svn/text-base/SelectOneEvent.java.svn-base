package com.ow.module.event.review.forum;

import java.util.HashMap;

import org.apache.log4j.Logger;

import com.ow.framework.common.Constant;
import com.ow.framework.data.po.ResultData;
import com.ow.framework.exception.DetailException;
import com.ow.framework.listener.event.EventExecutor;
import com.ow.framework.listener.event.EventListener;
import com.ow.framework.util.FileHelper;
import com.ow.framework.util.StringUtil;

public class SelectOneEvent implements EventListener {

	static Logger log = Logger.getLogger(Constant.FRAMEWORK);
	private ResultData resultData;

	public SelectOneEvent() {
		resultData = new ResultData();
	}

	public ResultData event(EventExecutor eventExecutor) throws Exception {
		try {
			String sid = eventExecutor.getSqlidByIndex(0);
			HashMap<String, String> map = eventExecutor.getBaseAction().getParamMap();

			String resURL = (String) map.get("resURL");

			resURL = java.net.URLDecoder.decode(resURL, "UTF-8");

			map.put("resURL", resURL);

			if (!"".equals(sid)) {
				HashMap one = (HashMap) eventExecutor.getSqlSession()
						.selectOne(sid, map);
				if (one == null) {
					one = new HashMap<Object, Object>();
					one.put("srResUrl", map.get("resURL"));
				}else{
					//String resurl=(String) one.get("srResUrl");
					String param_[] = {"code","path","paramMap.roomtype","paramMap.st","paramMap.name","paramMap.rfResType","pid"};
					String url = "";
					String pname[] = resURL.split("\\|");
					String url_ = ""; 
							
					for(int i=0;i<pname.length;i++){
						if(pname[i]!=null && !pname[i].equals("")){
							
							if(FileHelper.isMessyCode(pname[i])){
								pname[i] = new String(pname[i].toString().getBytes("ISO-8859-1"),"utf-8");
							}
							
							if(param_[i].equals("pid"))
								url_+="&"+"paramMap."+StringUtil.reResAbbreviated(pname[2])+"ID"+"="+pname[i];
							else
								url_+="&"+param_[i]+"="+pname[i];
							
						}
					}
					url += url_.replaceFirst("&", "").trim()+"&";
					one.put("srResUrl", resURL);
				}
				resultData.setOne(one);
			}
			return resultData;
		} catch (Exception e) {
			String error = DetailException.expDetail(e, SelectOneEvent.class);
			log.error(error);
			throw e;
		}
	}

}
