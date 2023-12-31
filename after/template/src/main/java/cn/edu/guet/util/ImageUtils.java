package cn.edu.guet.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * 图片工具类
 * @author 陶祎祎
 */
public class ImageUtils {

    /**
     * 从数据库拿到图片路径，用，分割形成一个list
     * @param str
     * @return
     */
    public static List<String> imageSplit(String str){
        List<String> result = new ArrayList<>();
        for (String s : str.split(",")) {
            result.add(s);
        }
        return result;
    }

    /**
     * 从数据库拿到图片路径，取第一个图片的url
     * @param str
     * @return
     */
    public static String getFirstImageUrl(String str){
        String[] split = str.split(",");
        return split[0];
    }

    /**

     * 将图片url拼接成一个字符串，以逗号分隔,
     */
    public static String getDBString(List<String> contractPhotoArray){
//        顺序不可替换，惰性匹配特性
        if(contractPhotoArray==null||contractPhotoArray.size()==0){
            return "";
        }
        String urlString=contractPhotoArray.get(0);
        for(int i=1;i<contractPhotoArray.size();i++){
            urlString=urlString+","+contractPhotoArray.get(i);
        }
        return urlString;
    }

    public static void deleteImages(String str){
        if(str!=null&&!"".equals(str)){
            List<String> images=new ArrayList<>();
            for (String s : str.split(",")) {
//                File photo= new File("static\\images\\" + s.split("/static/images/")[1]);
                File photo= new File("/static/images/" + s.split("/static/images/")[1]);
                if(photo.exists()){
                    System.out.println("删除原文件结果"+photo.delete());
                }
            }
        }
    }
}
