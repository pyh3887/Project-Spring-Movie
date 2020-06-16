package pack.ks.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.ks.model.ActorDto;
import pack.ks.model.InfoDto;
import pack.ks.model.InfoInter;
import pack.ks.model.PickDto;
import pack.ks.model.ReviewDto;
import pack.ks.model.StarDto;


@Controller
public class InfoController {
	@Autowired
	@Qualifier("infoImpl")
	private InfoInter inter;
	
	@RequestMapping("goinfo")	//인포 페이지 ㄱㄱ
	public ModelAndView goInfo(@RequestParam("name") String name){
		List<InfoDto> aa = inter.selectMovieInfo(name);
		if(aa.isEmpty()) {	//리스트가 널 값일 경우
			return new ModelAndView("info/info", "infos", inter.selectTvInfo(name));
		}else{
			return new ModelAndView("info/info", "infos", inter.selectMovieInfo(name));			
		} // jsp에서 jstl로 출력 한다
	}
	
	@RequestMapping("thumbs")	//별점 만들기 전에 만들어 둔거
	public String thumbsUp(@RequestParam("name") String name) throws UnsupportedEncodingException{
		inter.updateMoCnt(name);
		inter.updateTvCnt(name);
		String bb = URLEncoder.encode(name, "UTF-8");	// redirect로 보낼 때 한글이 깨지므로 인코딩을 해줘야 한다.
		return "redirect:/goinfo?name=" + bb;
	}
	
	
	@RequestMapping(value="reviewSave", method=RequestMethod.POST)		//리뷰 저장
	public String reviewSave(ReviewBean bean) throws UnsupportedEncodingException {
		inter.insertReview(bean);
		String cc = URLEncoder.encode(bean.getPro_name(), "UTF-8");		// redirect로 보낼 때 한글이 깨지므로 인코딩을 해줘야 한다.
		return "redirect:/goinfo?name=" + cc;
	}
	
	@RequestMapping(value="reviewOn", method=RequestMethod.GET)  // 리뷰 보기 위해서 불러온다.
	@ResponseBody
	public Map<String, Object> reveiwFunc(@RequestParam("name") String name){
		List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
		Map<String, String> data = null;
		List<ReviewDto> reviewList = inter.selectReview(name);	//모델과 통신
		
		for(ReviewDto j:reviewList) {
			data = new HashMap<String, String>();
			data.put("review_no", j.getReview_no());
			data.put("gogek_id", j.getGogek_id());
			data.put("content", j.getContent());
			data.put("review_cnt", j.getReview_cnt());
			data.put("review_title", j.getReview_title());
			data.put("pro_name", j.getPro_name());
			data.put("gogek_image", j.getGogek_image());
			data.put("review_date", j.getReview_date());
			dataList.add(data);
		}
		Map<String, Object> reviews = new HashMap<String, Object>();
		reviews.put("reviews", dataList);
		//System.out.println(reviews);
		return reviews;
	}
	
	@RequestMapping("reviewinfo")		//리뷰 더보기
	public ModelAndView reviewInfo(@RequestParam("name") String name){
		return new ModelAndView("info/reviewinfo", "review", inter.selectReview(name));		
	}
	
	@RequestMapping("reviewthumbs")		//리뷰  증가
	public String reviewthumbsUp(@RequestParam("review_no") String review_no, @RequestParam("name") String name) throws UnsupportedEncodingException{
		inter.updateReview(review_no);
		String dd = URLEncoder.encode(name, "UTF-8");	// redirect로 보낼 때 한글이 깨지므로 인코딩을 해줘야 한다.
		return "redirect:/reviewinfo?name=" + dd;
	}
	
	@RequestMapping("reviewreport")		//리뷰 신고
	public String reviewreport(@RequestParam("review_no") String review_no, @RequestParam("name") String name) throws UnsupportedEncodingException{
		inter.updateReport(review_no);
		String dd = URLEncoder.encode(name, "UTF-8");	// redirect로 보낼 때 한글이 깨지므로 인코딩을 해줘야 한다.
		return "redirect:/reviewinfo?name=" + dd;
	}
	
	@RequestMapping("infoReviewthumbs")		//리뷰 더보기에서 리뷰 증가
	public String infoReviewthumbsUp(@RequestParam("review_no") String review_no, @RequestParam("name") String name) throws UnsupportedEncodingException{
		inter.updateReview(review_no);
		String dd = URLEncoder.encode(name, "UTF-8");	// redirect로 보낼 때 한글이 깨지므로 인코딩을 해줘야 한다.
		return "redirect:/goinfo?name=" + dd;
	}
	
	@RequestMapping("infoReviewreport")		//리뷰 더보기에서 리뷰 신고
	public String infoReviewtreport(@RequestParam("review_no") String review_no, @RequestParam("name") String name) throws UnsupportedEncodingException{
		inter.updateReport(review_no);
		String dd = URLEncoder.encode(name, "UTF-8");	// redirect로 보낼 때 한글이 깨지므로 인코딩을 해줘야 한다.
		return "redirect:/goinfo?name=" + dd;
	}
	
	@RequestMapping(value="pickOn", method=RequestMethod.POST)		//찜
	public String pickOn(PickBean bean) throws UnsupportedEncodingException {
		inter.insertPick(bean);
		String aa = URLEncoder.encode(bean.getPro_name(), "UTF-8");	// redirect로 보낼 때 한글이 깨지므로 인코딩을 해줘야 한다.
		return "redirect:/goinfo?name=" + aa;
	}
	
	@RequestMapping(value="pickOff", method=RequestMethod.POST)		//찜 제거
	public String pickOff(PickBean bean) throws UnsupportedEncodingException {
		inter.deletePick(bean);
		String aa = URLEncoder.encode(bean.getPro_name(), "UTF-8");	// redirect로 보낼 때 한글이 깨지므로 인코딩을 해줘야 한다.
		return "redirect:/goinfo?name=" + aa;
	}
	
	@RequestMapping(value="pickCheck", method=RequestMethod.POST) //내가 찜을 했는지 안했는지 체크하기 위함
	@ResponseBody
	public int selectPickCheck(PickBean bean){
		List<PickDto> list = inter.selectPickCheck(bean);
		int check = 0;
		if(list.isEmpty())  check = 0;
		else check = 1;
		return check;
	}
	
	@RequestMapping(value="actorGo", method=RequestMethod.GET)  // 배우들을 출력하기 위함
	@ResponseBody
	public List<String> actorSelect(@RequestParam("name") String name){
//		List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
//		Map<String, String> data = null;
		String actorr = inter.selectActor(name);
		String[] actorArray = actorr.split(",");		//콤마를 기준으로 데이터를 찍는다
		
		List<String> actList = new ArrayList();
		for(int i = 0; i < actorArray.length; i++) {
			actList.add(actorArray[i]);
		}
		
		//System.out.println(actorArray);
		
//		for(String a:actList) {
//			data = new HashMap<String, String>();
//			data.put("actor_name", a.getActor_name());
//			dataList.add(data);
//		}
//		Map<String, Object> actors = new HashMap<String, Object>();
//		actors.put("actors", dataList);
		//System.out.println(reviews);
		return actList;
	}
	
	@RequestMapping(value="starGo", method=RequestMethod.POST)            // 별점을 주기위해서 기존에 별점 준 별점이 있으면 삭제하고 새로 준다.
	public String starInsert(StarBean bean) throws UnsupportedEncodingException {
		inter.deleteStar(bean);
		inter.insertStar(bean);
		double avgStar = inter.selectStar(bean);
		//System.out.println(avgStar);
		bean.setCnt(avgStar);
		inter.updateStar1(bean);
		inter.updateStar2(bean);
		String aa = URLEncoder.encode(bean.getPro_name(), "UTF-8");	// redirect로 보낼 때 한글이 깨지므로 인코딩을 해줘야 한다.
		return "redirect:/goinfo?name=" + aa;
	}
	
	@RequestMapping(value="pointWant", method=RequestMethod.GET)    // 별점을 보여주기 위해서 값을 받는다.
	@ResponseBody
	public List<String> pointWant(@RequestParam("name") String name){
		//System.out.println(name);
		String point1 = inter.point1(name);
		String point2 = inter.point1(name);
		String point3 = inter.point1(name);
		String point4 = inter.point1(name);
		String point5 = inter.point1(name);
		List<String> points  = new ArrayList();
		points.add(point1);
		points.add(point2);
		points.add(point3);
		points.add(point4);
		points.add(point5);
		return points;
	}
	
	@RequestMapping(value="infogengo", method=RequestMethod.GET)         // 정보 페이지 밑에 연관 장르에 출력하기 위함
	@ResponseBody
	public Map<String, Object> gengo(@RequestParam("genre") String genre, @RequestParam("name") String name){
		List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
		Map<String, String> data = null;
		GenreBean bean = new GenreBean();
		bean.setGenre(genre);
		bean.setName(name);
		
		List<InfoDto> genreList = inter.moselgenre(bean);	//모델과 통신
		
		if(genreList.isEmpty()) {	//리스트가 널 값일 경우
			genreList = inter.tvselgenre(bean);
		}else{
			genreList = inter.moselgenre(bean);
		}
		
		for(InfoDto g:genreList) {
			data = new HashMap<String, String>();
			data.put("name", g.getName());
			data.put("image", g.getImage());
			dataList.add(data);
		}
		Map<String, Object> genres = new HashMap<String, Object>();
		genres.put("genres", dataList);
		//System.out.println(reviews);
		return genres;
	}
	
	@RequestMapping("proinfogo")	//프로그램 인포 페이지 ㄱㄱ
	public ModelAndView proInfo(@RequestParam("name") String name){
		List<InfoDto> aa = inter.selectMovieInfo(name);
		if(aa.isEmpty()) {	//리스트가 널 값일 경우
			return new ModelAndView("info/proinfo", "proinfos", inter.selectTvInfo(name));
		}else{
			return new ModelAndView("info/proinfo", "proinfos", inter.selectMovieInfo(name));			
		} // jsp에서 jstl로 출력 한다
	}
	
	@RequestMapping("direcinfogo")	//감독 필모그래피 페이지 ㄱㄱ
	public ModelAndView direcInfo(@RequestParam("director") String director){
		List<InfoDto> pro = inter.directorMovie(director);
		pro.addAll(inter.directorTv(director));

		return new ModelAndView("info/directorinfo", "directorinfos", pro);
	}
	
	@RequestMapping("actorinfogo")	//배우 필모그래피 페이지 ㄱㄱ
	public ModelAndView actorInfo(@RequestParam("actor") String actor){
		actor = "%"+actor+"%";
		List<InfoDto> pro = inter.actorMovieInfo(actor);
		pro.addAll(inter.actorTvInfo(actor));
		
		return new ModelAndView("info/actorinfo.jsp?actor="+actor, "actorinfos", pro);
	}
	
	@RequestMapping("gogekinfogo")	//배우 필모그래피 페이지 ㄱㄱ
	public ModelAndView gogekInfo(@RequestParam("gogek_id") String gogek_id){
		return new ModelAndView("info/gogekinfo", "gogeks", inter.gogekInfo(gogek_id));
	}
	
	@RequestMapping(value="gmstar", method=RequestMethod.GET)   // 고객 인포에서 movie 별점 갯수
	@ResponseBody
	public String gmStar(@RequestParam("gogek_id") String gogek_id){
		//System.out.println("작동작동작동");
		String star = inter.gmStar(gogek_id);
		return star;
	}
	
	@RequestMapping(value="gtstar", method=RequestMethod.GET)    // 고객 인포에서 tv 별점 갯수
	@ResponseBody
	public String gtStar(@RequestParam("gogek_id") String gogek_id){
		//System.out.println("작동작동작동");
		String star = inter.gtStar(gogek_id);
		return star;
	}
	
	@RequestMapping(value="gmpick", method=RequestMethod.GET)   // 고객 인포에서 movie 별점 갯수
	@ResponseBody
	public String gmPick(@RequestParam("gogek_id") String gogek_id){
		//System.out.println("작동작동작동");
		String pick = inter.gmPick(gogek_id);
		return pick;
	}
	
	@RequestMapping(value="gtpick", method=RequestMethod.GET)	// 고객 인포에서 tv 별점 갯수
	@ResponseBody
	public String gtPick(@RequestParam("gogek_id") String gogek_id){
		//System.out.println("작동작동작동");
		String pick = inter.gtPick(gogek_id);
		return pick;
	}
	
	@RequestMapping("gogekmolist")	// 고객의 정보에서 찜한 정보
	public ModelAndView gogekMo(@RequestParam("gogek_id") String gogek_id){
		return new ModelAndView("info/gogekpicklist", "golist", inter.gogekMovie(gogek_id));
	}
	
	@RequestMapping("gogektvlist")	// 고객의 정보에서 찜한 정보
	public ModelAndView gogekTv(@RequestParam("gogek_id") String gogek_id){
		return new ModelAndView("info/gogekpicklist", "golist", inter.gogekTv(gogek_id));
	}
	
	@RequestMapping("gogekbogolist")	// 고객 정보에서 고객이 찜한 정보
	public ModelAndView gogekbogolist(@RequestParam("gogek_id") String gogek_id, @RequestParam("alm") String alm){
		if(alm.equals("영화")) {
		return new ModelAndView("info/bogoli", "golist", inter.gogekMop(gogek_id));
		} else {
			return new ModelAndView("info/bogoli", "golist", inter.gogekTvp(gogek_id));
		}
	}
}
