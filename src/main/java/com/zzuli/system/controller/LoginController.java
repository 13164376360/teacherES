package com.zzuli.system.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zzuli.po.StudentInfo;
import com.zzuli.recruitstudent.service.StudentInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzuli.po.AnthortyInfo;
import com.zzuli.po.StaffInfo;
import com.zzuli.system.dto.AnthortyDTO;
import com.zzuli.system.dto.ReportInfo;
import com.zzuli.system.service.AnthortyService;
import com.zzuli.system.service.ReportService;
import com.zzuli.system.service.StaffInfoService;

/**
 * 用户登录
 * 
 * @author mazg 2019年10月18日
 *
 */
@Controller
public class LoginController {

	@Resource(name = "staffInfoServiceImpl")
	private StaffInfoService staffInfoService;

	@Resource(name = "studentInfoServiceImpl")
	private StudentInfoService studentInfoService;

	@Resource(name = "anthortyServiceImpl")
	private AnthortyService anthortyService;

	@Resource(name="reportServiceImpl")
	private ReportService reportService;
	
	@RequestMapping("/out.do")
	public String out(HttpServletRequest request) {
		// 获取Session
		HttpSession session = request.getSession();
		session.removeAttribute("staff");
		return "login";
	}

	
	
	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@RequestMapping("/login.do")
	public String login(StaffInfo staffInfo, HttpServletRequest request) {

		// 获取Session
		HttpSession session = request.getSession();

		if (staffInfo != null && staffInfo.getUserNumber() != null
				&& !staffInfo.getUserNumber().equals("")
				&& staffInfo.getUserPassowrd() != null
				&& !staffInfo.getUserPassowrd().equals("")) {


			String userName = staffInfo.getUserNumber().substring(0, 5);
			if ("stude".equals(userName)&&userName.length() >= 5) {
				StudentInfo studentInfo = new StudentInfo();
				studentInfo.setStudentNumber(staffInfo.getUserNumber());
				studentInfo.setStudentPassword(staffInfo.getUserPassowrd());
				List<StudentInfo> list = studentInfoService.getStudentInfoList(studentInfo);

				if (list != null && list.size() > 0) {
					// 把当前用户登录信息保存到Session中
					StudentInfo student = list.get(0);
					session.setAttribute("student", student);
					//获取课程表和评教相关信息
					ReportInfo reportInfo = reportService.getReportInfo();
					session.setAttribute("reportInfo", reportInfo);


					// 根据角色编号查询出权限信息
					List<AnthortyInfo> anthlist = anthortyService.getAnthList(3);
					// 构建菜单（一级和二级）
					List<AnthortyDTO> dtolist = new ArrayList<AnthortyDTO>();
					for (AnthortyInfo anth : anthlist) {

						if (anth != null && anth.getAnthortyPid() == 1) {
							AnthortyDTO dto = new AnthortyDTO();
							dto.setAnth(anth);
							// 子菜单
							List<AnthortyInfo> sublist = new ArrayList<AnthortyInfo>();
							getAnthorty(sublist, anthlist, anth.getAnthortyId());
							dto.setList(sublist);
							dtolist.add(dto);
						}
					request.setAttribute("dtolist", dtolist);
					return "indexstudent";
				}

				} else {
					request.setAttribute("info", "账号或密码错误！");
				}


			} else {

				// 获取当前登录用户信息
				List<StaffInfo> list = staffInfoService.getList(staffInfo);
				if (list != null && list.size() > 0) {
					// 把当前用户登录信息保存到Session中
					StaffInfo staff = list.get(0);
					session.setAttribute("staff", staff);
					//获取报表信息
					ReportInfo reportInfo = reportService.getReportInfo();
					session.setAttribute("reportInfo", reportInfo);


					if (staff.getRoleId() != null) {
						// 根据角色编号查询出权限信息
						List<AnthortyInfo> anthlist = anthortyService.getAnthList(staff
								.getRoleId());

						// 构建菜单（一级和二级）
						List<AnthortyDTO> dtolist = new ArrayList<AnthortyDTO>();

						for (AnthortyInfo anth : anthlist) {

							if (anth != null && anth.getAnthortyPid() == 1) {
								AnthortyDTO dto = new AnthortyDTO();
								dto.setAnth(anth);

								// 子菜单
								List<AnthortyInfo> sublist = new ArrayList<AnthortyInfo>();
								getAnthorty(sublist, anthlist, anth.getAnthortyId());

								dto.setList(sublist);
								dtolist.add(dto);
							}
						}

						request.setAttribute("dtolist", dtolist);

						return "index";
					}

				} else {
					request.setAttribute("info", "账号或密码错误！");
				}

			}
		}else{
			request.setAttribute("info", "账号或密码不能为空！");
		}

		return "login";
	}

	public void getAnthorty(List<AnthortyInfo> sublist,
			List<AnthortyInfo> list, Integer anthortyId) {

		if (list != null && list.size() > 0) {
			for (AnthortyInfo anth : list) {
				if (anth != null && anth.getAnthortyPid() != null
						&& anth.getAnthortyPid().equals(anthortyId)) {

					sublist.add(anth);
					getAnthorty(sublist, list, anth.getAnthortyId());
				}
			}
		}

	}

}
