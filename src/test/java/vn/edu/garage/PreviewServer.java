package vn.edu.garage;

/** Chỉ dùng xem thử bằng H2; bản chạy chính dùng MySQL trong Docker Compose. */
public class PreviewServer {
    public static void main(String[] args) throws Exception {
        GarageWebTest.start();
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            try { GarageWebTest.stop(); } catch (Exception error) { error.printStackTrace(); }
        }));
        System.out.println("PREVIEW_URL=" + GarageWebTest.baseUrl + "/MainUI2.jsp");
        Thread.currentThread().join();
    }
}
