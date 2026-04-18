
# ==========================================
# 1. TRẠNG THÁI CƠ BẢN (Core & Pointing)
# ==========================================
ln -sf Zmidfinger    left_ptr       # Trỏ chuột mặc định
ln -sf Zhand         default        # Mặc định (alias)
ln -sf Zhand arrow          # Mũi tên (alias)
ln -sf Zmidfinger right_ptr      # Trỏ chuột hướng phải
ln -sf Zmidfinger wayland-cursor # Mặc định sâu của Wayland
ln -sf Zbusy        pointer        # Rê vào link web
ln -sf Zbusy hand           # Bàn tay (alias)
ln -sf Zmidfinger hand1          # Bàn tay 1 (alias)
ln -sf Zmidfinger hand2          # Bàn tay 2 (alias)

# ==========================================
# 2. XỬ LÝ & ĐANG TẢI (Loading & Progress)
# ==========================================
ln -sf  sweat wait         # Treo máy / Đang bận hoàn toàn (Đồng hồ cát/Xoay)
ln -sf  sweat watch          # Đang bận (alias)
ln -sf  Zworking progress       # Vẫn thao tác được nhưng nền đang tải
ln -sf  Zworking left_ptr_watch # Đang tải (alias mũi tên + đồng hồ)
ln -sf  Zworking half-busy      # Đang tải (alias)

# ==========================================
# 3. VĂN BẢN & ĐỒ HỌA (Text & Drawing)
# ==========================================
ln -sf Zbeam text           # Nhập văn bản (Cây gậy chữ I)
ln -sf Zbeam xterm          # Nhập văn bản (alias)
ln -sf Zbeam ibeam          # Nhập văn bản (alias)
ln -sf Zbeam vertical-text  # Nhập văn bản dọc (tiếng Nhật/Trung)
ln -sf Zcross crosshair      # Hồng tâm (chụp màn hình, ngắm bắn)
ln -sf Zcross cross          # Dấu cộng (alias)
ln -sf Zcross plus           # Dấu cộng (alias)
ln -sf Zcross cell           # Chọn ô trong Excel/Bảng tính
ln -sf Zpen pencil         # Cây bút (app vẽ)
ln -sf Zpen draft          # Cây bút (alias)

# ==========================================
# 4. TRỢ GIÚP & NGỮ CẢNH (Help & Context)
# ==========================================
ln -sf Zhelpsel help           # Hỏi chấm / Trợ giúp
ln -sf Zhelpsel whats_this     # Trợ giúp (alias)
ln -sf Zhelpsel question_arrow # Trợ giúp (alias)
ln -sf Zhelpsel context-menu   # Khi mở menu chuột phải

# ==========================================
# 5. CẤM & TỪ CHỐI (Forbidden)
# ==========================================
ln -sf Zanger not-allowed    # Không được phép / Nút bị khóa
ln -sf Zanger forbidden      # Cấm (alias)
ln -sf Zunavail crossed_circle # Vòng tròn gạch chéo
ln -sf Zunavail circle         # Vòng tròn (alias)
ln -sf Zunavail no-drop        # Cấm thả file vào đây

# ==========================================
# 7. CẦM, NẮM & KÉO THẢ (Grab & Drag-n-Drop)
# ==========================================
ln -sf Zbusy grab           # Bàn tay mở (Có thể nắm)
ln -sf Zbusy openhand       # Bàn tay mở (alias)
ln -sf Zbusy grabbing       # Đang nắm chặt chuột
ln -sf Zbusy closedhand     # Đang nắm chặt (alias)
ln -sf Zbusy dnd-move       # Kéo file để di chuyển
ln -sf Zbusy dnd-copy       # Kéo file để copy
ln -sf Zbusy copy           # Copy (alias)
ln -sf Zbusy dnd-link       # Kéo file để tạo shortcut
ln -sf Zbusy alias          # Tạo shortcut (alias)
ln -sf Zbusy dnd-none       # Kéo file ra vùng trống (vô tác dụng)
ln -sf Zbusy dnd-no-drop    # Kéo file vào vùng bị cấm
ln -sf Zbusy dnd-ask        # Hệ thống hỏi muốn Move hay Copy

# ==========================================
# 8. DI CHUYỂN & CHỈ HƯỚNG BÁT QUÁI (Move/Scroll)
# ==========================================
ln -sf Zdotmove move           # Di chuyển 4 hướng
ln -sf Zdotmove fleur          # Di chuyển 4 hướng (alias của X11)
ln -sf Zdotmove size_all       # Di chuyển 4 hướng (alias)
ln -sf Zdotmove all-scroll     # Đang cuộn chuột tự động
ln -sf Zup up-arrow     
ln -sf Zup up_arrow        
ln -sf Zup center_ptr

# ==========================================
# 9. THAY ĐỔI KÍCH THƯỚC (Resize - Window Borders)
# ==========================================
# Cạnh Dọc (Trên/Dưới)
ln -sf ZdotNS n-resize     
ln -sf ZdotNS s-resize     
ln -sf ZdotNS ns-resize
ln -sf ZdotNS row-resize
ln -sf ZdotNS top_side       # Cạnh trên (alias)
ln -sf ZdotNS bottom_side    # Cạnh dưới (alias)
ln -sf ZdotNS v_double_arrow # Mũi tên đôi dọc

# Cạnh Ngang (Trái/Phải)
ln -sf ZdotEW ew-resize      # Đông - Tây (East-West)
ln -sf ZdotEW e-resize       # Cạnh phải
ln -sf ZdotEW w-resize       # Cạnh trái
ln -sf ZdotEW col-resize     # Chỉnh cột (GTK/Web)
ln -sf ZdotEW right_side     # Cạnh phải (alias)
ln -sf ZdotEW left_side      # Cạnh trái (alias)
ln -sf ZdotEW h_double_arrow # Mũi tên đôi ngang

# Góc Chéo 1 (Trái-Trên xuống Phải-Dưới)
ln -sf ZdotNWSE nwse-resize    # Tây Bắc - Đông Nam
ln -sf ZdotNWSE nw-resize      # Góc Trái-Trên
ln -sf ZdotNWSE se-resize      # Góc Phải-Dưới
ln -sf ZdotNWSE top_left_corner 
ln -sf ZdotNWSE bottom_right_corner 
ln -sf ZdotNWSE bd_double_arrow 

# Góc Chéo 2 (Phải-Trên xuống Trái-Dưới)
ln -sf ZdotNESW ne-resize  
ln -sf ZdotNESW sw-resize  
ln -sf ZdotNESW nesw-resize 
ln -sf ZdotNESW fd_double_arrow 
ln -sf ZdotNESW top_right_corner 
ln -sf ZdotNESW bottom_left_corner
