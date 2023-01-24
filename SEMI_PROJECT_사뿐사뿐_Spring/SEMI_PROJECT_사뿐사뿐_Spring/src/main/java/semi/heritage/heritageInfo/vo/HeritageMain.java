package semi.heritage.heritageInfo.vo;

public class HeritageMain {
   
   private int sn;
   private int rowNum;
   private int no;
   private int countHfavorite;
   private String ccbaMnm1;
   private String ccbaCtcdNm;
   private String ccsiName;
   private String content;
   private String imageUrl;
   private int rNo;
   private int countHreview;
   
   public HeritageMain() {
      super();
   }

   public HeritageMain(int rowNum, int no, int countHfavorite, String ccbaMnm1, String ccbaCtcdNm, String ccsiName,
         String content, String imageUrl, int rNo, int countHreview) {
      super();
      this.rowNum = rowNum;
      this.no = no;
      this.countHfavorite = countHfavorite;
      this.ccbaMnm1 = ccbaMnm1;
      this.ccbaCtcdNm = ccbaCtcdNm;
      this.ccsiName = ccsiName;
      this.content = content;
      this.imageUrl = imageUrl;
      this.rNo = rNo;
      this.countHreview = countHreview;
   }
   
   public HeritageMain(int rowNum, int sn, int no, String ccbaMnm1, String ccbaCtcdNm, String ccsiName, String content, String imageUrl) {
      super();
      this.rowNum = rowNum;
      this.sn = sn;
      this.no = no;
      this.ccbaMnm1 = ccbaMnm1;
      this.ccbaCtcdNm = ccbaCtcdNm;
      this.ccsiName = ccsiName;
      this.content = content;
      this.imageUrl = imageUrl;
   }

   public int getSn() {
      return sn;
   }

   public void setSn(int sn) {
      this.sn = sn;
   }

   public int getRowNum() {
      return rowNum;
   }

   public void setRowNum(int rowNum) {
      this.rowNum = rowNum;
   }

   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public int getCountHfavorite() {
      return countHfavorite;
   }

   public void setCountHfavorite(int countHfavorite) {
      this.countHfavorite = countHfavorite;
   }

   public String getCcbaMnm1() {
      return ccbaMnm1;
   }

   public void setCcbaMnm1(String ccbaMnm1) {
      this.ccbaMnm1 = ccbaMnm1;
   }

   public String getCcbaCtcdNm() {
      return ccbaCtcdNm;
   }

   public void setCcbaCtcdNm(String ccbaCtcdNm) {
      this.ccbaCtcdNm = ccbaCtcdNm;
   }

   public String getCcsiName() {
      return ccsiName;
   }

   public void setCcsiName(String ccsiName) {
      this.ccsiName = ccsiName;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getImageUrl() {
      return imageUrl;
   }

   public void setImageUrl(String imageUrl) {
      this.imageUrl = imageUrl;
   }

   public int getrNo() {
      return rNo;
   }

   public void setrNo(int rNo) {
      this.rNo = rNo;
   }

   public int getCountHreview() {
      return countHreview;
   }

   public void setCountHreview(int countHreview) {
      this.countHreview = countHreview;
   }

   public String toString1() {
      return "heritageMainVO [rowNum=" + rowNum + ", no=" + no + ", countHfavorite=" + countHfavorite + ", ccbaMnm1="
            + ccbaMnm1 + ", ccbaCtcdNm=" + ccbaCtcdNm + ", ccsiName=" + ccsiName + ", content=" + content
            + ", imageUrl=" + imageUrl + ", rNo=" + rNo + ", countHreview=" + countHreview + "]" + "\n";
   }
   
   @Override
   public String toString() {
      return "heritageMainVO [sn=" + sn + ", ccbaMnm1=" + ccbaMnm1 + ", ccbaCtcdNm=" + ccbaCtcdNm + ", ccsiName=" + ccsiName + ", content=" + content
            + ", imageUrl=" + imageUrl + ", no=" + no + ", countHfavorite=" + countHfavorite + "]" + "\n";
   }
}