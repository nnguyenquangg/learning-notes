# Nguyên tắc SOLID là một tập hợp các nguyên tắc thiết kế phần mềm, được giới thiệu bởi Robert C. Martin (còn gọi là Uncle Bob), để giúp cho việc phát triển phần mềm trở nên dễ dàng hơn, linh hoạt hơn, dễ bảo trì hơn và dễ mở rộng hơn. SOLID là viết tắt của năm nguyên tắc:

1. Single Responsibility Principle (SRP) - Nguyên tắc đơn trách nhiệm
- Một lớp, phương thức hoặc module nên chỉ có một trách nhiệm duy nhất.

2. Open-Closed Principle (OCP) - Nguyên tắc mở đóng
- Phần mềm nên được thiết kế để dễ dàng mở rộng, nhưng không làm thay đổi mã nguồn đã được viết.

3. Liskov Substitution Principle (LSP) - Nguyên tắc thay thế Liskov
- Một đối tượng có thể được thay thế bằng bất kỳ đối tượng con của nó mà không làm thay đổi tính đúng đắn của chương trình.

4. Interface Segregation Principle (ISP) - Nguyên tắc phân chia giao diện
- Nên thiết kế các giao diện hợp lý để giảm thiểu sự phụ thuộc vào các thành phần không cần thiết.

5. Dependency Inversion Principle (DIP) - Nguyên tắc đảo ngược sự phụ thuộc
- Mô-đun cấp cao không nên phụ thuộc vào các mô-đun cấp thấp, mà nên phụ thuộc vào các trừu tượng (abstraction).