package com.enation.app.shop.front.api.repair;

import org.apache.log4j.Logger;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.enation.eop.processor.core.Request;
import com.enation.framework.action.JsonResult;
import com.enation.framework.util.JsonResultUtil;

@Controller
@RequestMapping("/api/repair")
public class RepairApiController {

	private static final Logger logger = Logger.getLogger(RepairApiController.class);
	@ResponseBody
	@RequestMapping(value="/test",produces = MediaType.APPLICATION_JSON_VALUE,method=RequestMethod.GET)
	public JsonResult test(){
		logger.info("repair 测试");
		return JsonResultUtil.getSuccessJson("repair test");
	}
}
