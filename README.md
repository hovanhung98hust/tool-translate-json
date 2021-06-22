# tool-translate-json - DART
- Đây là một tool để convert file json từ ngôn ngữ này qua ngôn ngữ khác và giữ nguyên key
chỉ thay đổi giá trị.
- Bỏ file soure vào folder assets, thay đổi code của ngôn ngữ cần biên

Lưu ý:
* Kết quả trả về lúc bỏ vào 1 file json sẽ chỉ có 1 dòng, nếu có nhiều hơn
1 dòng thì cắt các dòng đó lên cùng dòng thứ 1 và thêm kí tự \n, vì value gốc có cái
đó nên mới làm kết quả bị xuống dòng
* Khi cùng 1 dòng mà ko bị báo lỗi gì chỉ cần format thì sẽ đc kết quả đúng
Format: Window (Ctrl + Alt + L) - Mac (Cmd + Alt + L)dịch
* Kết quả sẽ được copy vào bộ nhớ của điện thoại (limit sẽ lên đến 1/16 ram
của điện thoại nên sẽ ko bị limit)
