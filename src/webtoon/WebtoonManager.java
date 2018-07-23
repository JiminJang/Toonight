package webtoon;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
 
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import webtoon.WebtoonDTO;

public class WebtoonManager {
   
    public static List<WebtoonDTO> webtoonNaverData() {
        
        List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
        
        try {
            Document naver_doc = Jsoup.connect("https://comic.naver.com/webtoon/weekday.nhn").get();   // 웹툰을 가져올 페이지                 
            Elements naver_title = naver_doc.select("div.list_area div.col div.col_inner ul li a.title");   // 웹툰 제목            
            Elements naver_poster = naver_doc.select("div.list_area div.col div.col_inner ul li div.thumb img");   // 썸네일 //select("img[src$=.png]")
            Elements naver_url = naver_doc.select("div.list_area div.col div.col_inner ul li a.title");
            
            for (int i = 0; i < naver_title.size(); i++) {
                
                if(i > naver_title.size()) break;
                
                Element telem = naver_title.get(i);
                Element pelem = naver_poster.get(i);               
                String img = pelem.attr("src");      //    img 태그안에 있는 내용중 src 만 가져온다.
                Element uelem = naver_url.get(i);
                String href = uelem.attr("href");                 
                WebtoonDTO vo = new WebtoonDTO();    //    데이터를 수집, DTO를 선언한 후 DTO의 변수들을 setter를 이용해서 하나씩 넣도록 한다. 
                vo.setNumber(i + 1);   //    번호 지정 (1번부터 넣도록 한다.)
                vo.setPoster(img);
                vo.setTitle(telem.text());
                vo.setUrl(href);
                     
                list.add(vo);
                } 
        }
            
           // for(WebtoonDTO m : list) {
          //     System.out.println(m.toString());
           //    }
  
            
            catch (IOException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
           }
                
              return list;        
          
    }
    
    
    
    public static List<WebtoonDTO> webtoonDaumData() {
     List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
        
        try {
            Document daum_doc = Jsoup.connect("http://webtoon.daum.net/").get();   // 웹툰을 가져올 페이지                 
            Elements daum_title = daum_doc.select("div#daumContent div#cmain div.cont_schedule div div.warp_webtoon ul.list_wt li a.link_wt strong.tit_wt");   // 웹툰 제목            
            Elements daum_poster = daum_doc.select("div#daumContent div#cmain div.cont_schedule div div.warp_webtoon ul.list_wt li a.link_wt img");   // 썸네일 //select("img[src$=.png]")
            Elements daum_url = daum_doc.select("div#daumContent div#cmain div.cont_schedule div div.warp_webtoon ul.list_wt li a.link_wt");
            
            for (int i = 0; i < daum_title.size(); i++) {
                
                if(i > daum_title.size()) break;
                
                Element telem = daum_title.get(i);
                Element pelem = daum_poster.get(i);               
                String img = pelem.attr("src");      //    img 태그안에 있는 내용중 src 만 가져온다.
                Element uelem = daum_url.get(i);
                String href = uelem.attr("href");                 
                WebtoonDTO vo = new WebtoonDTO();    //    데이터를 수집, DTO를 선언한 후 DTO의 변수들을 setter를 이용해서 하나씩 넣도록 한다. 
                vo.setNumber(i + 250);   //    번호 지정 (1번부터 넣도록 한다.)
                vo.setPoster(img);
                vo.setTitle(telem.text());
                vo.setUrl(href);
                     
                list.add(vo);
                } 
        }
            
           // for(WebtoonDTO m : list) {
          //     System.out.println(m.toString());
           //    }
  
            
            catch (IOException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
           }
                
              return list;        
          
    }
    
    public static List<WebtoonDTO> webtoonLezhinData() {
        List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
           
           try {
               Document daum_doc = Jsoup.connect("https://www.lezhin.com/ko/scheduled").get();   // 웹툰을 가져올 페이지                 
               Elements daum_title = daum_doc.select("section#comic-sheduled-list div.wrap div.comic-scheduled-comic div.homelist-wrap ul.tabcontent li a div.homelist-title span");   // 웹툰 제목            
               Elements daum_poster = daum_doc.select("section#comic-sheduled-list div.wrap div.comic-scheduled-comic div.homelist-wrap ul.tabcontent li a div.homelist-thumb");   // 썸네일 //select("img[src$=.png]")
               Elements daum_url = daum_doc.select("section#comic-sheduled-list div.wrap div.comic-scheduled-comic div.homelist-wrap ul.tabcontent li a");
               
               for (int i = 0; i < daum_title.size(); i++) {
                   
                   if(i > daum_title.size()) break;
                   
                   Element telem = daum_title.get(i);
                   Element pelem = daum_poster.get(i);               
                   String img = pelem.attr("src");      //    img 태그안에 있는 내용중 src 만 가져온다.
                   Element uelem = daum_url.get(i);
                   String href = uelem.attr("href");                 
                   WebtoonDTO vo = new WebtoonDTO();    //    데이터를 수집, DTO를 선언한 후 DTO의 변수들을 setter를 이용해서 하나씩 넣도록 한다. 
                   vo.setNumber(i + 1);   //    번호 지정 (1번부터 넣도록 한다.)
                   vo.setPoster(img);
                   vo.setTitle(telem.text());
                   vo.setUrl(href);
                        
                   list.add(vo);
                   } 
           }
               
              // for(WebtoonDTO m : list) {
             //     System.out.println(m.toString());
              //    }
     
               
               catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
              }
                   
                 return list;        
             
       }
    
            
    public static List<WebtoonDTO> webtoonKToonData() {
        List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
           
           try {
               Document daum_doc = Jsoup.connect("https://www.myktoon.com/web/webtoon/works_list.kt").get();   // 웹툰을 가져올 페이지                 
               Elements daum_title = daum_doc.select("section.main_list div.week_all article.col div.inner ul.toon_main li.tm7 a.link div.info strong");   // 웹툰 제목            
               Elements daum_poster = daum_doc.select("section.main_list div.week_all article.col div.inner ul.toon_main li.tm7 a.link div.thumb img");   // 썸네일 //select("img[src$=.png]")
               Elements daum_url = daum_doc.select("section.main_list div.week_all article.col div.inner ul.toon_main li.tm7 a.link");
               
               for (int i = 0; i < daum_title.size(); i++) {
                   
                   if(i > daum_title.size()) break;
                   
                   Element telem = daum_title.get(i);
                   Element pelem = daum_poster.get(i);               
                   String img = pelem.attr("src");      //    img 태그안에 있는 내용중 src 만 가져온다.
                   Element uelem = daum_url.get(i);
                   String href = uelem.attr("href");                 
                   WebtoonDTO vo = new WebtoonDTO();    //    데이터를 수집, DTO를 선언한 후 DTO의 변수들을 setter를 이용해서 하나씩 넣도록 한다. 
                   vo.setNumber(i+1);   //    번호 지정 (1번부터 넣도록 한다.)
                   vo.setPoster(img);
                   vo.setTitle(telem.text());
                   vo.setUrl(href);
                        
                   list.add(vo);
                   } 
           }
               
              // for(WebtoonDTO m : list) {
             //     System.out.println(m.toString());
              //    }
     
               
               catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
              }
                   
                 return list;        
             
       }
    
    
    
    /*---------------------------------------------------------------
     * 웹툰 상세보기
     * ---------------------------------------------------------------*/
    
    //    해당 번호에 대한 정보를 가져오도록 한다. 
    //    번호를 1번 부터 설정했기 떄문에 no=1에 해당하는 데이터는 0번지에 저장 되어있다. 
    //    따라서 1번 데이터를 클릭 시 0번지에 해당하는 데이터를 가져올 수 있도록 -1을 하도록 한다. 
    public static WebtoonDTO webtoonDetail(int no) {
        List<WebtoonDTO> list = webtoonNaverData();
        WebtoonDTO vo = list.get(no-1);
        
        return vo;
    }
    
    public static WebtoonDTO KToon_webtoonDetail(int no) {
        List<WebtoonDTO> list = webtoonKToonData();
        WebtoonDTO vo = list.get(no-1);
        
        return vo;
    }
}