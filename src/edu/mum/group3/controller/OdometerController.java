package edu.mum.group3.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import edu.mum.group3.bean.OdometerBean;
import edu.mum.group3.model.Odometer;
import edu.mum.group3.service.OdometerService;

/**
 * @author Lwin Moe Aung
 *
 */
@Controller
public class OdometerController {

	@Autowired
	private OdometerService odometerService;

	protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
		CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(Date.class, editor);
	}

	@RequestMapping(value = "/saveOdometer", method = RequestMethod.POST)
	public ModelAndView saveOdometer(@ModelAttribute("command") OdometerBean odometerBean, BindingResult result) {
		Odometer odometer = prepareModel(odometerBean);
		odometerService.addOdometer(odometer);
		return new ModelAndView("redirect:/odometers.html");
	}

	@RequestMapping(value = "/odometers", method = RequestMethod.GET)
	public ModelAndView listOdometers() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("odometers", prepareListofBean(odometerService.listOdometers()));
		return new ModelAndView("odometersList", model);
	}

	@RequestMapping(value = "/addOdometer", method = RequestMethod.GET)
	public ModelAndView addOdometer(@ModelAttribute("command") OdometerBean odometerBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("odometers", prepareListofBean(odometerService.listOdometers()));
		return new ModelAndView("addOdometer", model);
	}

	@RequestMapping(value = "/deleteOdometer", method = RequestMethod.GET)
	public ModelAndView deleteOdometer(@ModelAttribute("command") OdometerBean odometerBean, BindingResult result) {
		odometerService.deleteOdometer(prepareModel(odometerBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("odometer", "null");
		model.put("odometers", prepareListofBean(odometerService.listOdometers()));
		return new ModelAndView("odometersList", model);
	}

	@RequestMapping(value = "/editOdometer", method = RequestMethod.GET)
	public ModelAndView editOdometer(@ModelAttribute("command") OdometerBean odometerBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("odometer", prepareModelBean(odometerService.getOdometer(odometerBean.getId())));
		model.put("odometers", prepareListofBean(odometerService.listOdometers()));
		return new ModelAndView("addOdometer", model);
	}

	private Odometer prepareModel(OdometerBean odometerBean) {
		Odometer odometer = new Odometer();

		odometer.setOdometerVal(odometerBean.getOdometerVal());
		odometer.setChkService(odometerBean.getChkService());
		odometer.setDate(odometerBean.getDate());
		odometer.setStatus(odometerBean.getStatus());
		odometer.setVehicleId(odometerBean.getVehicleId());
		odometer.setServiceDate(odometerBean.getServiceDate());
		odometer.setOdometerId(odometerBean.getId());
		odometerBean.setId(null);
		return odometer;
	}

	private List<OdometerBean> prepareListofBean(List<Odometer> odometers) {
		List<OdometerBean> beans = null;
		if (odometers != null && !odometers.isEmpty()) {
			beans = new ArrayList<OdometerBean>();
			OdometerBean bean = null;
			for (Odometer odometer : odometers) {
				bean = new OdometerBean();

				bean.setOdometerVal(odometer.getOdometerVal());
				bean.setChkService(odometer.getChkService());
				bean.setDate(odometer.getDate());
				bean.setStatus(odometer.getStatus());
				bean.setVehicleId(odometer.getVehicleId());
				bean.setServiceDate(odometer.getServiceDate());
				bean.setId(odometer.getOdometerId());

				beans.add(bean);
			}
		}
		return beans;
	}

	private OdometerBean prepareModelBean(Odometer odometer) {
		OdometerBean bean = new OdometerBean();

		bean.setOdometerVal(odometer.getOdometerVal());
		bean.setChkService(odometer.getChkService());
		bean.setDate(odometer.getDate());
		bean.setStatus(odometer.getStatus());
		bean.setVehicleId(odometer.getVehicleId());
		bean.setServiceDate(odometer.getServiceDate());

		bean.setId(odometer.getOdometerId());
		return bean;
	}
}