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

	   List<WebtoonDTO> list1 = WebtoonManager.webtoonNaverData();
	   List<WebtoonDTO> list2=WebtoonManager.webtoonKToonData();
	   List<WebtoonDTO> list3=WebtoonManager.webtoonFoxtoonData();
	   List<WebtoonDTO> list4=WebtoonManager.webtoonToomicsData();
	   List<WebtoonDTO> list5=WebtoonManager.webtoonPeanutoonData();
	   
	   
   
   //���̹�
    public static List<WebtoonDTO> webtoonNaverData() {
        
        List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
        
        try {
            Document naver_doc = Jsoup.connect("https://comic.naver.com/webtoon/weekday.nhn").get();   // ������ ������ ������                 
            Elements naver_title = naver_doc.select("div.list_area div.col div.col_inner ul li a.title");   // ���� ����            
            Elements naver_poster = naver_doc.select("div.list_area div.col div.col_inner ul li div.thumb img");   // ����� //select("img[src$=.png]")
            Elements naver_url = naver_doc.select("div.list_area div.col div.col_inner ul li a.title");
            
            for (int i = 0; i < naver_title.size(); i++) {
                
                if(i > naver_title.size()) break;
                
                Element telem = naver_title.get(i);
                Element pelem = naver_poster.get(i);               
                String img = pelem.attr("src");    
                Element uelem = naver_url.get(i);
                String href = uelem.attr("href");                 
                WebtoonDTO vo = new WebtoonDTO();   
                vo.setNumber(i + 1);  
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
               Document daum_doc = Jsoup.connect("https://www.myktoon.com/web/webtoon/works_list.kt").get();  
               Elements daum_title = daum_doc.select("section.main_list div.week_all article.col div.inner ul.toon_main li.tm7 a.link div.info strong");  
               Elements daum_poster = daum_doc.select("section.main_list div.week_all article.col div.inner ul.toon_main li.tm7 a.link div.thumb img");  
               Elements daum_url = daum_doc.select("section.main_list div.week_all article.col div.inner ul.toon_main li.tm7 a.link");
               
               for (int i = 0; i < daum_title.size(); i++) {
                   
                   if(i > daum_title.size()) break;
                   
                   Element telem = daum_title.get(i);
                   Element pelem = daum_poster.get(i);               
                   String img = pelem.attr("src");     
                   Element uelem = daum_url.get(i);
                   String href = uelem.attr("href");                 
                   WebtoonDTO vo = new WebtoonDTO();   
                   vo.setNumber(i + 1);   
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
    
    
    // īī�� ������
    public static List<WebtoonDTO> webtoonKakaoData() {
        List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
           
           try {
             // Document doc = Jsoup.connect("https://page.kakao.com/main?categoryUid=10&subCategoryUid=1001").get();   // ������ ������ ������                 
               //Elements title = doc.select("div.ReactVirtualized__Grid__innerScrollContainer div.listItemBox div.jsx-1190658265 a.jsx-1190658265 div.textWrap span.titleWrap p.text-ellipsis");   // ���� ����            
               //Elements poster = doc.select("div.ReactVirtualized__Grid__innerScrollContainer div.listItemBox div.jsx-1190658265 a.jsx-1190658265 div.thumbnailWrap div.container img");   // ����� //select("img[src$=.png]")
               //Elements url = doc.select("div.ReactVirtualized__Grid__innerScrollContainer div.listItemBox div.jsx-1190658265 a.jsx-1190658265");
               
              Document doc = Jsoup.connect("https://page.kakao.com/main?categoryUid=10&subCategoryUid=1000").get();   // ������ ������ ������                 
               Elements title = doc.select("div.contents div.listContentBox ul.listItemBox li.listItem a.jsx-81541574 div.textWrap soan.titleWrap p.text-ellipsis");   // ���� ����            
               Elements poster = doc.select("div#root div.contents div.listContentBox ul.listItemBox li.listItem a.jsx-81541574 div.thumbnailWrap div.container img");   // ����� //select("img[src$=.png]")
               Elements url = doc.select("div#root div.contents div.listContentBox ul.listItemBox li.listItem a.jsx-81541574");
              for (int i = 0; i < title.size(); i++) {
                   
                   if(i > title.size()) break;
                   
                   Element telem = title.get(i);
                   Element pelem = poster.get(i);               
                   String img = pelem.attr("src");      //    img �±׾ȿ� �ִ� ������ src �� �����´�.
                   Element uelem = url.get(i);
                   String href = uelem.attr("href");                 
                   WebtoonDTO vo = new WebtoonDTO();    //    �����͸� ����, DTO�� ������ �� DTO�� �������� setter�� �̿��ؼ� �ϳ��� �ֵ��� �Ѵ�. 
                   vo.setNumber(i + 1);   //    ��ȣ ���� (1������ �ֵ��� �Ѵ�.)
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

    
    //   �ǳ���
    public static List<WebtoonDTO> webtoonPeanutoonData() {
        List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
           
           try {
              Document doc = Jsoup.connect("http://www.peanutoon.com/cmweek.php?menu=all").get();   // ������ ������ ������                 
               Elements title = doc.select("div#wrapper div#container div.comics_content_list div#cmweek div.sub_list a div.sub_list_thumb dl dt.ellipsis span.cm_title");   // ���� ����            
               Elements poster = doc.select("div#wrapper div#container div.comics_content_list div#cmweek div.sub_list a div.sub_list_thumb dl dt img");   // ����� //select("img[src$=.png]")
               Elements url = doc.select("div#wrapper div#container div.comics_content_list div#cmweek div.sub_list a");
               for (int i = 0; i < title.size(); i++) {
                   
                   if(i > title.size()) break;
                   
                   Element telem = title.get(i);
                   Element pelem = poster.get(i);               
                   String img = pelem.attr("src");      //    img �±׾ȿ� �ִ� ������ src �� �����´�.
                   Element uelem = url.get(i);
                   String href = uelem.attr("href");                 
                   WebtoonDTO vo = new WebtoonDTO();    //    �����͸� ����, DTO�� ������ �� DTO�� �������� setter�� �̿��ؼ� �ϳ��� �ֵ��� �Ѵ�. 
                   vo.setNumber(i + 1000);   //    ��ȣ ���� (1������ �ֵ��� �Ѵ�.)
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
    
    
    //   ������
    public static List<WebtoonDTO> webtoonFoxtoonData() {
        List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
           
           try {
              Document doc = Jsoup.connect("http://www.foxtoon.com/comic").get();   // ������ ������ ������                 
               Elements title = doc.select("div#wrap div#comic_schedule_table div.comic_schedule ul.comic_schedule_day li.comic a div.des div.title");   // ���� ����            
               Elements poster = doc.select("div#wrap div#comic_schedule_table div.comic_schedule ul.comic_schedule_day li.comic a div.fox_thumbnail img.total");   // ����� 
               Elements url = doc.select("div#wrap div#comic_schedule_table div.comic_schedule ul.comic_schedule_day li.comic a");
               for (int i = 0; i < title.size(); i++) {
                   
                   if(i > title.size()) break;
                   
                   Element telem = title.get(i);
                   Element pelem = poster.get(i);               
                   String img = pelem.attr("src");      //    img �±׾ȿ� �ִ� ������ src �� �����´�.
                   Element uelem = url.get(i);
                   String href = uelem.attr("href");                 
                   WebtoonDTO vo = new WebtoonDTO();    //    �����͸� ����, DTO�� ������ �� DTO�� �������� setter�� �̿��ؼ� �ϳ��� �ֵ��� �Ѵ�. 
                   vo.setNumber(i + 1);   //    ��ȣ ���� (1������ �ֵ��� �Ѵ�.)
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
    
    
    //   ���ͽ�
    public static List<WebtoonDTO> webtoonToomicsData() {
        List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
           
           try {
              Document doc = Jsoup.connect("http://www.toomics.com/webtoon/weekly_all").get();   // ������ ������ ������                 
               Elements title = doc.select("div#wrapper div#contents div.inner div.weekly-all div ul.body li a div.caption strong.title");   // ���� ����            
               Elements poster = doc.select("div#wrapper div#contents div.inner div.weekly-all div ul.body li a div.thumb img.img-fluid");   // ����� 
               Elements url = doc.select("div#wrapper div#contents div.inner div.weekly-all div ul.body li a");
               for (int i = 0; i < title.size(); i++) {
                   
                   if(i > title.size()) break;
                   
                   Element telem = title.get(i);
                   Element pelem = poster.get(i);               
                   String img = pelem.attr("src");      //    img �±׾ȿ� �ִ� ������ src �� �����´�.
                   Element uelem = url.get(i);
                   String href = uelem.attr("href");                 
                   WebtoonDTO vo = new WebtoonDTO();    //    �����͸� ����, DTO�� ������ �� DTO�� �������� setter�� �̿��ؼ� �ϳ��� �ֵ��� �Ѵ�. 
                   vo.setNumber(i + 1);   //    ��ȣ ���� (1������ �ֵ��� �Ѵ�.)
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
     * ���� �󼼺���
     * ---------------------------------------------------------------*/
    
    //    �ش� ��ȣ�� ���� ������ ���������� �Ѵ�. 
    //    ��ȣ�� 1�� ���� �����߱� ������ no=1�� �ش��ϴ� �����ʹ� 0������ ���� �Ǿ��ִ�. 
    //    ���� 1�� �����͸� Ŭ�� �� 0������ �ش��ϴ� �����͸� ������ �� �ֵ��� -1�� �ϵ��� �Ѵ�. 
    
    //   ���̹�
    public static WebtoonDTO webtoonDetail(int no) {
        List<WebtoonDTO> list = webtoonNaverData();
        WebtoonDTO vo = list.get(no-1);
        
        return vo;
    }
    
    //   ������
    public static WebtoonDTO KToon_webtoonDetail(int no) {
        List<WebtoonDTO> list = webtoonKToonData();
        WebtoonDTO vo = list.get(no-1);
        
        return vo;
    }
    
    public static WebtoonDTO Kakao_webtoonDetail(int no) {
        List<WebtoonDTO> list = webtoonKakaoData();
        WebtoonDTO vo = list.get(no-1);
        
        return vo;
    }
    
    public static WebtoonDTO Peanutoon_webtoonDetail(int no) {
        List<WebtoonDTO> list = webtoonPeanutoonData();
        WebtoonDTO vo = list.get(no-1);
        
        return vo;
    }
    
    public static WebtoonDTO Foxtoon_webtoonDetail(int no) {
        List<WebtoonDTO> list = webtoonFoxtoonData();
        WebtoonDTO vo = list.get(no-1);
        
        return vo;
    }
    
    public static WebtoonDTO Toomics_webtoonDetail(int no) {
        List<WebtoonDTO> list = webtoonToomicsData();
        WebtoonDTO vo = list.get(no-1);
        
        return vo;
    }
}
