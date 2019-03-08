package com.ow.module.event.sysmgr.test;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.ow.framework.data.po.ResultData;
import com.ow.framework.exception.DetailException;
import com.ow.framework.listener.event.EventExecutor;
import com.ow.framework.listener.event.EventListener;

public class TestViewEventByID
  implements EventListener
{
  static Logger log = Logger.getLogger("FRAMEWORK");
  private ResultData resultData;

  public TestViewEventByID()
  {
    this.resultData = new ResultData();
  }

  public ResultData event(EventExecutor eventExecutor)
    throws Exception
  {
    try
    {
      String sid = eventExecutor.getSqlidByIndex(0);
      HashMap map = eventExecutor.getBaseAction().getParamMap();

      map.put("testClass", (String)map.get("erCateTwLevel"));

      if (!"".equals(sid))
      {
        List rlist = eventExecutor.getSqlSession().selectList(sid, map);
        map.put("testcount", "1");
        this.resultData.setList(rlist);
      }
      return this.resultData;
    }
    catch (Exception e)
    {
      String error = DetailException.expDetail(e, TestViewEventByID.class);
      log.error(error);
      throw e;
    }
  }
}