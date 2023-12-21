*** Settings ***
Resource            ../keywords/common.robot
Library             DateTime

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***
### Link to Test Cases    https://docs.google.com/spreadsheets/d/1BcOkWzu3LqH4ZF731aBCCrDFJId8G0j63ROUn4X1kk4/edit#gid=16073683 ###

### Check the User Interface of the Data page
DA_01 Verify that navigating to the right "Data" page
    [Tags]                                                                            mainpage                        ui                               smoketest
    Login to admin
    When Click "QUẢN LÝ DANH MỤC" menu
    When Click "Quản lý dữ liệu" sub menu to "/data"
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contains the list data from database
    Then Webpage should contains the search function
    Then Webpage should contain "Thêm mới dữ liệu" button

DA_02 Verify the function changing the number of data show in each list
    [Tags]                                                                            mainpage                        ui                               smoketest
    Go to "Quản lý dữ liệu" page
    When Click on "second" selection to change the number of account show in list and check
    When Click on "third" selection to change the number of account show in list and check
    When Click on "fourth" selection to change the number of account show in list and check
    When Click on "fifth" selection to change the number of account show in list and check

DA_03 Verify the function navigating to other lists of data page
    [Tags]                                                                            mainpage                        ui                               smoketest
    Go to "Quản lý dữ liệu" page
    Then Check the amount of page list
    ${Last_name}=                                                                    Get the last account name
    When Create a test data with "_@Tên loại@_" type
    When Move to the "next" page
    When Move to the "perious" page
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line 
    When Move to the last page and check
    When Click on the "Xóa" button in the "_@Tên loại@_" item line 
DA_04 Verify the highlight table line funtion after operated
    [Tags]                                                                            mainpage                        ui                               smoketest
    Create a test category
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Click "Đóng lại" button
    Then "_@Tiêu đề@_" table line should be highlighted
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    
### Verify the User Interface of edit data page
DA_05 Verify that navigating to the right "edit data" page
    [Tags]                                                                            DetailedInfo
    Create a test category
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Chi tiết" button in the "_@Tiêu đề@_" table line
    Then Heading should contain "Chỉnh sửa dữ liệu" inner Text
    Then Webpage should contain "Chuyên mục" select field
    Then Webpage should contain "Tiêu đề" input field
    When Click "Trở lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

DA_06 Check data information after creation
    [Tags]                                                                              DetailedInfo
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Chi tiết" button in the "_@Tiêu đề@_" table line
    Then Data's information in "Chuyên mục" should be equal "_@Tên loại@_"
    Then Data's information in "Thứ tự" should be equal "_@Thứ tư@_"
    Then Data's information in "Tiêu đề" should be equal "_@Tiêu đề@_"
    Then Data's information in "Mô tả" should be equal "_@Mô tả@_"
    Then Data's information in "Nội dung" should be equal "_@Nội dung@_"
    When Click "Trở lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

### Verify the go back button in the detail information's data page
DA_07 Verify the "Đóng lại" button
    [Tags]                                                    DetailedInfo                                             Button
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Chi tiết" button in the "_@Tiêu đề@_" table line
    When Click "Trở lại" button
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contain "Thêm mới dữ liệu" button
    Then Webpage should contains the list data from database
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

DA_08 Verify the "Left-arrow" button
    [Tags]                                                    DetailedInfo                                             Button
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Chi tiết" button in the "_@Tiêu đề@_" table line
    When Click on the left arrow icon
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contain "Thêm mới dữ liệu" button
    Then Webpage should contains the list data from database
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

### Verify the search function
DA_09 Verify the search function when enter the existed name
    [Tags]                                                       Search
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Enter "test name" in "Tìm kiếm" with "_@Tiêu đề@_"
    When Click on magnifier icon in search box
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

DA_10 Verify the search function when enter the name was not existed
    [Tags]                                                       Search
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Enter "text" in "Tìm kiếm" with "_RANDOM_"
    When Click on magnifier icon in search box
    Then Table line should show empty 
    When Enter "test name" in "Tìm kiếm" with ""
    When Click on magnifier icon in search box
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

DA_11 Check the update of data list after cancel the search action
    [Tags]                                                       Search
    ${Data1}=                                                     Create a test data with "_@Tên loại@_" type   
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Enter "text" in "Tìm kiếm" with "${Data1}"
    When Click on magnifier icon in search box
    Then "_@Tiêu đề@_" should not be visible in table line
    Then "${Data1}" should be visible in table line
    When Click on the "Xóa" button in the "${Data1}" table line
    Then "_@Tiêu đề@_" should be visible in table line
    When Enter "text" in "Tìm kiếm" with ""
    When Click on magnifier icon in search box
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

### Verify the creating data function
# DA_12 Verify "Thêm mới dữ liệu" button function
#     [Tags]                                                         Create
#     Go to "Quản lý dữ liệu" page
#     Create a test category
#     Select on the "_@Tên loại@_" item line
#     When Click "Thêm mới dữ liệu" button
#     When Click "Trở lại" button
#     When Click on the "Xóa" button in the "_@Tên loại@_" item line
#     Then Heading should contain "Thêm mới dữ liệu" inner Text
#     Then Confirm adding data "/data" page
#     Then Webpage should contain "Chuyên mục" select field
#     Then Webpage should contain "Thứ tự" input field
#     Then Webpage should contain "Tiêu đề" input field
#     Then Webpage should contain "Mô tả" input field
#     Then Webpage should contain "Nội dung" input field
#     Then Webpage should contain "Lưu lại" button
#     Then Webpage should contain "Đóng lại" button

DA_13 Create new data with the valid data
    [Tags]                                                         Create
    Create a test category 
    Select on the "_@Tên loại@_" item line
    When Click "Thêm mới dữ liệu " button
    When Click select "Chuyên mục" with "_@Tên loại@_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Enter "paragraph" in textarea "Nội dung" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

DA_14 Check the update of data list after creating a new data
    [Tags]                                                         Create
    Create a test category 
    Select on the "_@Tên loại@_" item line
    When Click "Thêm mới dữ liệu " button
    When Click select "Chuyên mục" with "_@Tên loại@_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Enter "paragraph" in textarea "Nội dung" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

### Create new data with blank field
DA_15 Create a new data with all blank fields
    [Tags]                                                        Create                                                  BlankField 
    Go to page create data "Quản lý dữ liệu" with "/data"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng chọn chuyên mục" displayed under "Chuyên mục" field
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field

DA_16 Create a new data when leaving "Chuyên mục" field blank
    [Tags]                                                        Create                                                  BlankField 
    Go to page create data "Quản lý dữ liệu" with "/data"
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng chọn chuyên mục" displayed under "Chuyên mục" field

DA_17 Create a new data when leaving "Tiêu đề" field blank
    [Tags]                                                        Create                                                  BlankField 
    Create a test category 
    Select on the "_@Tên loại@_" item line
    When Click "Thêm mới dữ liệu" button
    When Click select "Chuyên mục" with "_@Tên loại@_"
    Then Required message "Xin vui lòng nhập tiêu đề" displayed under "Tiêu đề" field
    When Click "Lưu lại" button

### Create new data with invalid data
DA_18 Create a new data with the invalid "Tiêu đề"
    [Tags]                                                         Create                                                     Invalid  
    Create a test category
    Select on the "_@Tên loại@_" item line
    Create a test data with "_@Tên loại@_" type
    When Click "Thêm mới dữ liệu" button
    When Click select "Chuyên mục" with "_@Tên loại@_"
    When Enter "test name" in "Tiêu đề" with "_@Tiêu đề@_"
    When Click "Lưu lại" button
    Then User look message "Tiêu đề đã tồn tại" popup
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

### Verify the go back button in the creating data page
DA_19 Verify the "Đóng lại" button
    [Tags]                                                           Create                                                      Button
    Go to page create data "Quản lý dữ liệu" with "/data"
    When Click "Đóng lại" button
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contain "Thêm mới dữ liệu" button
    Then Webpage should contains the list data from database

DA_20 Verify the "Left-arrow" button
    [Tags]                                                           Create                                                      Button
    Go to page create data "Quản lý dữ liệu" with "/data"
    When Click on the left arrow icon
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contain "Thêm mới dữ liệu" button
    Then Webpage should contains the list data from database

### Verify the funtion of changing data information
DA_21 Verify the changing "Chuyên mục" field
    [Tags]                                                                        ChangeInfo 
    ${Cate1}=                                                                      Create a test category
    Create a test category
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Click select "Chuyên mục" with "${Cate1}"
    When Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    When Select on the "${Cate1}" item line
    Then "_@Tiêu đề@_" should be visible in table line
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    When Click on the "Xóa" button in the "${Cate1}" item line

DA_22 Verify the changing "Thứ tự" field
    [Tags]                                                                        ChangeInfo 
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    When Click on the "Chi tiết" button in the "_@Tiêu đề@_" table line
    Then Data's information in "Thứ tự" should be equal "_@Thứ tự@_"
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

DA_23 Verify the changing "Tiêu đề" field
    [Tags]                                                                        ChangeInfo 
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    
Da_24 Verify the changing "Mô tả" field
    [Tags]                                                                        ChangeInfo 
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Enter "text" in textarea "Mô tả" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    When Click on the "Chi tiết" button in the "_@Tiêu đề@_" table line
    Then Data's information in "Mô tả" should be equal "_@Mô tả@_"
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

DA_25 Verify the changing "Nội dung" field
    [Tags]                                                                        ChangeInfo 
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Enter "text" in textarea "Nội dung" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Cập nhật thành công" popup
    When Click on the "Chi tiết" button in the "_@Tiêu đề@_" table line
    Then Data's information in "Nội dung" should be equal "_@Nội dung@_"
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

### Verify the button's function in the edit information page
DA_26 Verify the "Đóng lại" button
    [Tags]                                                       ChangeInfo                                                      Button                                         
    Create a test category 
    Create a test data with "_@Tên loại@_" type
    When Select on the "_@Tên loại@_" item line
    When Click on the "Sửa" button in the "_@Tiêu đề@_" table line
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tiêu đề@_" item line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
*** Keywords ***
# Compare Strings Ignoring Leading and Trailing Whitespaces
#     [Arguments]    ${actual}    ${expected}
#     ${actual_stripped}=    Set Variable    ${actual.strip()}
#     Should Be Equal As Strings    ${actual_stripped}    ${expected}

# Go to "${page}" page
#     Login to admin
#     Click "QUẢN LÝ DANH MỤC" menu
#     ${cnt}=    Get Length    ${page}
#     IF    ${cnt} > 0 and '${page}' == 'Order'
#         Click "Order" sub menu to "/order"
#     ELSE IF    ${cnt} > 0 and '${page}' == 'Quản lý dữ liệu'
#         Click "Quản lý dữ liệu" sub menu to "/data"
#     END

# Go to page create account "${name}" with "${url}"
#     Login to admin
#     Click "QUẢN LÝ DANH MỤC" menu
#     Click "${name}" sub menu to "${url}"
#     Click "Tạo mới" button

# Create a test account with "${type}" type
#     ${condition}=    Run Keyword And Return Status    Confirm locating exactly in "Quản lý dữ liệu" page
#     IF    '${condition}' == 'True'
#         Click "Thêm mới dữ liệu" button
#     ELSE
#         Go to page create account "Quản lý dữ liệu" with "/data"
#     END
#     Click select "Chuyên mục" with "HSBC"
#     Enter "word" in "Tiêu đề" with "_RANDOM_"
#     Enter "word" in textarea "Mô tả" with "_RANDOM_"
#     Enter "word" in textarea "Nội dung" with "_RANDOM_"
#     ${text}=    Check Text    _@Họ và tên@_
#     ${name}=    Set Variable    ${text}
#     Click "Lưu lại" button
#     User look message "Success" popup
#     RETURN    ${name}
Go to "${page}" page
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    ${cnt}=    Get Length    ${page}
    IF    ${cnt} > 0 and '${page}' == 'Quản lý dữ liệu'
        Click "Quản lý dữ liệu" sub menu to "/data"
    END
Go to page create data "${name}" with "${url}"
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    Click "${name}" sub menu to "${url}"
    Click "Thêm mới dữ liệu" button

Create a test data with "_@Tên loại@_" type
   ${condition}=    Run Keyword And Return Status    Confirm locating exactly in "Quản lý dữ liệu" page
    IF    '${condition}' == 'True'
        Click "Thêm mới dữ liệu" button
    ELSE
        Go to page create data "Quản lý dữ liệu" with "/data"
    END
    Enter "test name" in "Tiêu đề" with "_RANDOM_"
    ${text}=    Check Text    _@Tiêu đề@_
    ${name}=    Set Variable    ${text}
    Click select "Chuyên mục" with "_@Tên loại@_"
    Enter "number" in "Thứ tự" with "_RANDOM_"   
    Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    Enter "paragraph" in textarea "Nội dung" with "_RANDOM_"  
    Click "Lưu lại" button
    User look message "Success" popup
    RETURN    ${name}

Create a test category
   ${condition}=    Run Keyword And Return Status    Confirm locating exactly in "Quản lý dữ liệu" page
    IF    '${condition}' == 'True'
        Click "Tạo mới" button
    ELSE
        Go to page create category "Quản lý dữ liệu" with "/data"
    END
    Enter "test name" in "Tên loại" with "_RANDOM_"
    ${text}=    Check Text    _@Tên loại@_
    ${name}=    Set Variable    ${text}
    Enter "number" in "Mã" with "_RANDOM_"
    Click "Lưu lại" button
    User look message "Success" popup
    RETURN    ${name}

Go to page create category "${name}" with "${url}"
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    Click "${name}" sub menu to "${url}"
    Click "Tạo mới" button

Heading of separated group should contain "${text}" inner Text
  ${actual_text}            Get Text                  //*[contains(@class,'sm:h-14')]//span[contains(@class, 'ng-star-inserted')]                          
  Should Be Equal           ${text}                   ${actual_text}
