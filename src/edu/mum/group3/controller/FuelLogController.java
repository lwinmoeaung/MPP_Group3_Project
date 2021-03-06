package edu.mum.group3.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.mum.group3.bean.FuelLogBean;
import edu.mum.group3.bean.VehicleBean;
import edu.mum.group3.bean.VendorBean;
import edu.mum.group3.model.FuelLog;
import edu.mum.group3.model.Vehicle;
import edu.mum.group3.model.Vendor;
import edu.mum.group3.service.FuelLogService;
import edu.mum.group3.service.VehicleService;
import edu.mum.group3.service.VendorService;

/**
 * @author Lwin Moe Aung
 *
 */
@Controller
public class FuelLogController {

	@Autowired
	private FuelLogService fuelLogService;
	
	@Autowired
	private VehicleService vehicleService;
	
	@Autowired
	private VendorService vendorService;
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@RequestMapping(value = "/saveFuelLog", method = RequestMethod.POST)
	public ModelAndView saveFuelLog(@ModelAttribute("command") FuelLogBean fuelLogBean, BindingResult result) {
		FuelLog fuelLog = prepareModel(fuelLogBean);
		fuelLogService.addFuelLog(fuelLog);
		return new ModelAndView("redirect:/fuelLogs.html");
	}

	@RequestMapping(value = "/fuelLogs", method = RequestMethod.GET)
	public ModelAndView listFuelLogs() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("fuelLogs", prepareListofBean(fuelLogService.listFuelLogs()));
		return new ModelAndView("fuelLogsList", model);
	}

	@RequestMapping(value = "/addFuelLog", method = RequestMethod.GET)
	public ModelAndView addFuelLog(@ModelAttribute("command") FuelLogBean fuelLogBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("fuelLogs", prepareListofBean(fuelLogService.listFuelLogs()));
		model.put("vehicles", prepareVehicleListofBean(vehicleService.listVehicles()));
		model.put("vendors", prepareVendorListofBean(vendorService.listVendors()));
		return new ModelAndView("addFuelLog", model);
	}

	@RequestMapping(value = "/deleteFuelLog", method = RequestMethod.GET)
	public ModelAndView deleteFuelLog(@ModelAttribute("command") FuelLogBean fuelLogBean, BindingResult result) {
		fuelLogService.deleteFuelLog(prepareModel(fuelLogBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("fuelLog", "null");
		model.put("fuelLogs", prepareListofBean(fuelLogService.listFuelLogs()));
		return new ModelAndView("fuelLogsList", model);
	}

	@RequestMapping(value = "/editFuelLog", method = RequestMethod.GET)
	public ModelAndView editFuelLog(@ModelAttribute("command") FuelLogBean fuelLogBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("fuelLog", prepareModelBean(fuelLogService.getFuelLog(fuelLogBean.getId())));
		model.put("fuelLogs", prepareListofBean(fuelLogService.listFuelLogs()));
		model.put("vehicles", prepareVehicleListofBean(vehicleService.listVehicles()));
		model.put("vendors", prepareVendorListofBean(vendorService.listVendors()));
		return new ModelAndView("addFuelLog", model);
	}

	private FuelLog prepareModel(FuelLogBean fuelLogBean) {
		FuelLog fuelLog = new FuelLog();

		fuelLog.setDate(fuelLogBean.getDate());
		fuelLog.setInvoiceReference(fuelLogBean.getInvoiceReference());
		fuelLog.setLiter(fuelLogBean.getLiter());
		fuelLog.setOtherInfo(fuelLogBean.getOtherInfo());
		fuelLog.setPricePerLiter(fuelLogBean.getPricePerLiter());
		fuelLog.setTotalPrice(fuelLogBean.getTotalPrice());
		fuelLog.setVehicleId(fuelLogBean.getVehicleId());
		fuelLog.setVendorId(fuelLogBean.getVendorId());

		fuelLog.setFuelLogId(fuelLogBean.getId());
		fuelLogBean.setId(null);
		return fuelLog;
	}

	private List<VehicleBean> prepareVehicleListofBean(List<Vehicle> vehicles) {
		List<VehicleBean> beans = null;
		if (vehicles != null && !vehicles.isEmpty()) {
			beans = new ArrayList<VehicleBean>();
			VehicleBean bean = null;
			for (Vehicle vehicle : vehicles) {
				bean = new VehicleBean();
				bean.setId(vehicle.getVehicleId());
				bean.setVehicleName(vehicle.getVehicleName());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private List<VendorBean> prepareVendorListofBean(List<Vendor> vendors) {
		List<VendorBean> beans = null;
		if (vendors != null && !vendors.isEmpty()) {
			beans = new ArrayList<VendorBean>();
			VendorBean bean = null;
			for (Vendor vendor : vendors) {
				bean = new VendorBean();
				bean.setId(vendor.getVendorId());
				bean.setVendorName(vendor.getVendorName());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private List<FuelLogBean> prepareListofBean(List<FuelLog> fuelLogs) {
		List<FuelLogBean> beans = null;
		if (fuelLogs != null && !fuelLogs.isEmpty()) {
			beans = new ArrayList<FuelLogBean>();
			FuelLogBean bean = null;
			for (FuelLog fuelLog : fuelLogs) {
				bean = new FuelLogBean();

				bean.setId(fuelLog.getFuelLogId());

				bean.setDate(fuelLog.getDate());
				bean.setInvoiceReference(fuelLog.getInvoiceReference());
				bean.setLiter(fuelLog.getLiter());
				bean.setOtherInfo(fuelLog.getOtherInfo());
				bean.setPricePerLiter(fuelLog.getPricePerLiter()); 
				bean.setTotalPrice(fuelLog.getTotalPrice());
				bean.setVehicleName(vehicleService.getVehicle(fuelLog.getVehicleId()).getVehicleName());
				bean.setVendorId(fuelLog.getVendorId());
				bean.setVendorName(vendorService.getVendor(fuelLog.getVendorId()).getVendorName());
				beans.add(bean);
			}
		}
		return beans;
	}

	private FuelLogBean prepareModelBean(FuelLog fuelLog) {
		FuelLogBean bean = new FuelLogBean();

		bean.setDate(fuelLog.getDate());
		bean.setInvoiceReference(fuelLog.getInvoiceReference());
		bean.setLiter(fuelLog.getLiter());
		bean.setOtherInfo(fuelLog.getOtherInfo());
		bean.setPricePerLiter(fuelLog.getPricePerLiter());
		bean.setTotalPrice(fuelLog.getTotalPrice());
		bean.setVehicleId(fuelLog.getVehicleId());
		bean.setVendorId(fuelLog.getVendorId());
		bean.setId(fuelLog.getFuelLogId());
		return bean;
	}
}
