*** Settings ***
Resource            ../keywords/common.robot
Library             DateTime

Test Setup              Setup
Test Teardown           Tear Down
 

*** Test Cases ***
## Link to Test Cases  https://docs.google.com/spreadsheets/d/1BcOkWzu3LqH4ZF731aBCCrDFJId8G0j63ROUn4X1kk4/edit#gid=1426559516 ###

### Check the User Interface of the Category page ###
CO_01 Verify that navigating to the right "Post Category" page
    [Tags]    mainpage    ui    smoketest
    Login to admin
    When Click "QUẢN LÝ DANH MỤC" menu
    When Click "Post" sub menu to "/post"
    Then Confirm locating exactly in "Post" page
    Then Heading of separated group should contain "Chuyên mục" inner Text
    Then Webpage should contain "Tạo mới" button
    Then Webpage should contains the list data from database
CO_02 Verify that highlight category line after clicking on it
    [Tags]    mainpage    ui    smoketest
    Go to "Post" page
    When Click "Tạo mới" button
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    When Click "Lưu lại" button
    When Select on the "_@Tiêu đề@_" item line
    Then "_@Tiêu đề@_" item line should be highlighted
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line

### Verify the creating post type function		
CO_03 Verify "Tạo mới" button function
    [Tags]    create      smoketest
    Go to "Post" page
    When Click "Tạo mới" button
    Then Confirm adding account "/post/categories" page 
    Then Heading should contains "Thêm mới chuyên mục" inner Text
    Then Heading of separated group should contain "Thông tin" inner Text
    Then Webpage should contain "Tiêu đề" input field
    Then Webpage should contain "Giới thiệu" input field 
    Then Webpage should contain "Lưu lại" button
    Then Webpage should contain "Đóng lại" button
    Then Webpage should contain left arrow icon

CO_04 Create new post type with the valid data
    [Tags]    create      smoketest
    Go to page create category "Post" with "/post"         
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Thêm mới danh mục bài viết thành công" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line

CO_05 Check the update of data list after creating a new categories
    [Tags]    create      smoketest    
    Go to page create category "Post" with "/post"         
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Thêm mới danh mục bài viết thành công" popup
    Then "_@Tiêu đề@_" should be visible in item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line

### Create new post with blank field

CO_06 Create a new data with all blank fields
    [Tags]    create      blankfield    
    Go to page create category "Post" with "/post"         
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field
CO_07 Create a new data when leaving "Tiêu đề" field blank
    [Tags]    create      blankfield    
    Go to page create category "Post" with "/post"
    When Enter "word" in "Slug" with "_RANDOM_"         
    When Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field

CO_08 Create a new data when leaving "Slug" field blank
    [Tags]    create      blankfield    
    Go to page create category "Post" with "/post"         
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Thêm mới danh mục bài viết thành công" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
CO_09 Create a new data when leaving "Giới thiệu" field blank
    [Tags]    create      blankfield    
    Go to page create category "Post" with "/post"         
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Thêm mới danh mục bài viết thành công" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line   
### Create new data with invalid data
CO_10 Create a new data with the existence of "Tiêu đề"
    [Tags]    create    invalidData
    Create a test post_category
    When Click "Tạo mới" button
    When Enter "test name" in "Tiêu đề" with "_@Tiêu đề@_"
    When Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Tiêu đề đã tồn tại" popup
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line

### Verify the go back function of buttons in Creating page
CO_11 Check the "Đóng lại" button
    [Tags]    create    button
    Go to page create category "Post" with "/post"
    When Click "Đóng lại" button
    Then Confirm locating exactly in "Post" page
    Then Webpage should contains the list data from database
    Then Webpage should contain "Tạo mới" button

CO_12 Check the left arrow icon ("Trở lại" button)
    [Tags]    create    button
    Go to page create category "Post" with "/post"
    When Click on the left arrow icon
    Then Confirm locating exactly in "Post" page
    Then Webpage should contains the list data from database
    Then Webpage should contain "Tạo mới" button

CO_13 Check the (left arrow icon) "Trở lại" button
    [Tags]    create    button
    Go to page create category "Post" with "/post"
    When Click "Trở lại" button
    Then Confirm locating exactly in "Post" page
    Then Webpage should contains the list data from database
    Then Webpage should contain "Tạo mới" button

### Verify the funtion of changing data information
CO_14 Verify the changing "Tiêu đề" field
    [Tags]    changeInfo
    Create a test post_category
    When Click on the "Sửa" button in the "_@Tiêu đề@_" item line
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Cập nhật bài viết thành công" popup
    Then "_@Tiêu đề@_" should be visible in item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
CO_15 Verify the changing "Slug" field
    [Tags]  ChangeInfo 
    Create a test post_category
    When Click on the "Sửa" button in the "_@Tiêu đề@_" item line
    When Enter "word" in "Slug" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Cập nhật bài viết thành công" popup
    When Click on the "Sửa" button in the "_@Tiêu đề@_" item line
    # Then Data's information in "Slug" should be equal "_@Slug@_"
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
CO_16 Verify the changing "Giới thiệu" field
    [Tags]  ChangeInfo 
    Create a test post_category
    When Click on the "Sửa" button in the "_@Tiêu đề@_" item line
    When Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Cập nhật bài viết thành công" popup
    When Click on the "Sửa" button in the "_@Tiêu đề@_" item line
    # Then Data's information in "Giới thiệu" should be equal "_@Giới thiệu@_"
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
# CO_17 Verify the changing with the existed "Tiêu đề"
#     [Tags]    changeInfo
#     ${category}=       Create a test post_category
#     Create a test post_category
#     When Click on the "Sửa" button in the "${category}" item line
#     When Enter "test name" in "Tiêu đề" with "_@Tiêu đề@_"
#     When Click "Lưu lại" button
#     Then User look message "Tiêu đề đã tồn tại" popup
#     When Click "Đóng lại" button
#     When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
#     When Click on the "Xóa" button in the "${category}" item line


### Verify the go back function of buttons in change information's page
CO_18 Check the "Đóng lại" button in edit infomation page
    [Tags]    changeInfo    button
    Create a test post_category
    When Click on the "Sửa" button in the "_@Tiêu đề@_" item line
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
    Then Confirm locating exactly in "Post" page
    Then Webpage should contains the list data from database
    Then Webpage should contain "Tạo mới" button

CO_19 Check the left arrow icon ("Trở lại" button) in edit infomation page
    [Tags]    changeInfo    button
    Create a test post_category
    When Click on the "Sửa" button in the "_@Tiêu đề@_" item line
    When Click on the left arrow icon
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
    Then Confirm locating exactly in "Post" page
    Then Webpage should contains the list data from database
    Then Webpage should contain "Tạo mới" button

CO_20 Check the (left arrow icon) "Trở lại" button in edit infomation page
    [Tags]    changeInfo    button
    Create a test post_category
    When Click on the "Sửa" button in the "_@Tiêu đề@_" item line
    When Click on the left arrow icon
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
    Then Confirm locating exactly in "Post" page
    Then Webpage should contains the list data from database
    Then Webpage should contain "Tạo mới" button

### Verify the delete data function
CO_21 Verify the delete data function
    [Tags]  Delete                                                                        
    Create a test post_category
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
    Then User look message "Đã xóa thành công" popup
    Then "_@Tiêu đề@_" should not be visible in item line

CO_22 Verify the cancel action button when delete data
    [Tags]  Delete                                                                        
    Create a test post_category
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line with cancel
    Then "_@Tiêu đề@_" should be visible in item line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
# CT_23 Check to delete category that still having data inside
#     [Tags]  Delete                                                                        
#     Create a test post_category
#     When Click "Thêm mới dữ liệu" button
#     When Click select "Chuyên mục" with "_@Tiêu đề@_"
#     When Enter "number" in "Thứ tự" with "_RANDOM_"
#     When Enter "test name" in "Tiêu đề" with "_RANDOM_"
#     When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
#     When Enter "paragraph" in textarea "Nội dung" with "_RANDOM_"
#     When Click "Lưu lại" button
#     When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
#     Then User look message "Danh mục có dữ liệu không thể xóa" popup
#     When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
#     When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
*** Keywords ***
Go to "${page}" page
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    ${cnt}=    Get Length    ${page}
    IF    ${cnt} > 0 and '${page}' == 'Post'
        Click "Post" sub menu to "/post"
    END
Go to page create category "${name}" with "${url}"
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    Click "${name}" sub menu to "${url}"
    Click "Tạo mới" button

Create a test post_category
   ${condition}=    Run Keyword And Return Status    Confirm locating exactly in "Post" page
    IF    '${condition}' == 'True'
        Click "Tạo mới" button
    ELSE
        Go to page create category "Post" with "/post"
    END
    Enter "test name" in "Tiêu đề" with "_RANDOM_"
    ${text}=    Check Text    _@Tiêu đề@_
    ${name}=    Set Variable    ${text}
    Enter "paragraph" in textarea "Giới thiệu" with "_RANDOM_"
    Click "Lưu lại" button
    User look message "Thêm mới danh mục bài viết thành công" popup
    RETURN    ${name}

