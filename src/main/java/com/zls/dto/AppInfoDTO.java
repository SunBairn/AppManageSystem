package com.zls.dto;

import com.zls.pojo.DevUser;

//应用程序DTO对象（这里的字段名字要和我们前端的标签的name值相同）
public class AppInfoDTO {
    private String softwareName;
    private Long appStatus;
    private Long appFlatform;
    private Long levelOne;
    private Long levelTwo;
    private Long levelThree;
    private Integer pageNum;
    private Long DevUserId;
    private String apkName;
    private String supportRom;
    private String interfaceLanguage;
    private String softwareSize;
    private String appInfo;

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }

    public Long getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(Long appStatus) {
        this.appStatus = appStatus;
    }

    public Long getAppFlatform() {
        return appFlatform;
    }

    public void setAppFlatform(Long appFlatform) {
        this.appFlatform = appFlatform;
    }

    public Long getLevelOne() {
        return levelOne;
    }

    public void setLevelOne(Long levelOne) {
        this.levelOne = levelOne;
    }

    public Long getLevelTwo() {
        return levelTwo;
    }

    public void setLevelTwo(Long levelTwo) {
        this.levelTwo = levelTwo;
    }

    public Long getLevelThree() {
        return levelThree;
    }

    public void setLevelThree(Long levelThree) {
        this.levelThree = levelThree;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Long getDevUserId() {
        return DevUserId;
    }

    public void setDevUserId(Long devUserId) {
        DevUserId = devUserId;
    }

    public String getApkName() {
        return apkName;
    }

    public void setApkName(String apkName) {
        this.apkName = apkName;
    }

    public String getSupportRom() {
        return supportRom;
    }

    public void setSupportRom(String supportRom) {
        this.supportRom = supportRom;
    }

    public String getInterfaceLanguage() {
        return interfaceLanguage;
    }

    public void setInterfaceLanguage(String interfaceLanguage) {
        this.interfaceLanguage = interfaceLanguage;
    }

    public String getSoftwareSize() {
        return softwareSize;
    }

    public void setSoftwareSize(String softwareSize) {
        this.softwareSize = softwareSize;
    }

    public String getAppInfo() {
        return appInfo;
    }

    public void setAppInfo(String appInfo) {
        this.appInfo = appInfo;
    }

    @Override
    public String toString() {
        return "AppInfoDTO{" +
                "softwareName='" + softwareName + '\'' +
                ", appStatus=" + appStatus +
                ", appFlatform=" + appFlatform +
                ", levelOne=" + levelOne +
                ", levelTwo=" + levelTwo +
                ", levelThree=" + levelThree +
                ", pageNum=" + pageNum +
                '}';
    }
}
