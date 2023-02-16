package cn.edu.guet.bean.common;

import lombok.Data;

/**
 * @author 陶祎祎
 */
@Data
public class ExportParamsModel {

    private String searchWord;

    @Override
    public String toString() {
        return "ExportParamsModel{" +
                "searchWord='" + searchWord + '\'' +
                '}';
    }
}
