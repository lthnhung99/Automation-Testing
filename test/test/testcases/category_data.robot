*** Settings ***
Resource            ../keywords/common.robot
Library             DateTime

Test Setup          Setup
Test Teardown       Tear Down


*** Test Cases ***
### Link to Test Cases    https://docs.google.com/spreadsheets/d/1BcOkWzu3LqH4ZF731aBCCrDFJId8G0j63ROUn4X1kk4/edit#gid=2075608964 ###

### Check the User Interface of the Cateogry page ###
CT_01 Verify that navigating to the right "Category Data" page
    [Tags]                                                                            mainpage                        ui                               smoketest
    Login to admin
    When Click "QUẢN LÝ DANH MỤC" menu
    When Click "Quản lý dữ liệu" sub menu to "/data"
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contains the list account from database
    Then Webpage should contain "Tạo mới" button

CT_02 Verify that highlight category line after clicking on it
    [Tags]                                                                            mainpage                        ui                                smoketest
    Go to "Quản lý dữ liệu" page
    When Click "Tạo mới" button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Enter "number" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
### Verify the creating data function

CT_03 Verify "Tạo mới" button function
    [Tags]                                                                        create
    Go to "Quản lý dữ liệu" page
    When Click "Tạo mới" button
    Then Heading should contain " Thêm mới chuyên mục " inner Text
    Then Confirm adding account "/data/type" page
    Then Webpage should contain "Tên loại" input field
    Then Webpage should contain "Mã" input field
    Then Webpage should contain "Lưu lại" button
    Then Webpage should contain "Đóng lại" button
    Then Webpage should contain left arrow icon

CT_04 Create new data with the valid data
    [Tags]                                                                        create
    Go to page create account "Quản lý dữ liệu" with "/data"
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Enter "number" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

CT_05 Check the update of data list after creating a new categories
    [Tags]                                                                         create
    Go to page create account "Quản lý dữ liệu" with "/data"
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Enter "number" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    Then "_@Tên loại@_" should be visible in item line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

### Create new data with blank field
CT_06 Create a new data with all blank fields
    [Tags]                                                                Create                                     BlankField 
    Go to page create account "Quản lý dữ liệu" with "/data"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tên loại" displayed under "Tên loại" field
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

CT_07 Create a new data when leaving "Tên loại" field blank
    [Tags]                                                                Create                                     BlankField 
    Go to page create account "Quản lý dữ liệu" with "/data"
    When Enter "number" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập tên loại" displayed under "Tên loại" field

CT_08 Create a new data when leaving "Mã" field blank
    [Tags]                                                                Create                                     BlankField 
    Go to page create account "Quản lý dữ liệu" with "/data"
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Click "Lưu lại" button
    Then Required message "Xin vui lòng nhập mã" displayed under "Mã" field

### Create new data with invalid data
CT_09 Create a new data with the existence of "Tên loại"
    [Tags]                                                                Create                                     BlankField
    Create a test account with "category" type 
    When Click "Tạo mới" button
    When Enter "test name" in "Tên loại" with "_@Tên loại@_"
    When Enter "number" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Tên danh mục đã tồn tại" popup
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

CT_10 Create a new data with the invalid "Mã"
    [Tags]                                                                Create                                     BlankField
    ${Cate1}=                                                  Create a test account with "category" type
    When Click "Tạo mới" button
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Enter "number" in "Mã" with "_@Mã@_"
    When Click "Lưu lại" button
    Then User look message "Code đã tồn tại" popup
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "${Cate1}" item line
    
### Verify the go back function of buttons in Creating page
CT_11 Check the "Đóng lại" button
    [Tags]                                                                   Create                                         button
    Go to page create account "Quản lý dữ liệu" with "/data"
    When Click "Đóng lại" button
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contains the list account from database
    Then Webpage should contain "Tạo mới" button

CT_12_01 Check the left arrow icon ("Trở lại" button)
    [Tags]                                                                   Create                                         button
    Go to page create account "Quản lý dữ liệu" with "/data"
    When Click on the left arrow icon
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contains the list account from database
    Then Webpage should contain "Tạo mới" button

CT_12_02 Check the (left arrow icon) "Trở lại" button
    [Tags]                                                                   Create                                         button
    Go to page create account "Quản lý dữ liệu" with "/data"
    When Click "Trở lại" button
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contains the list account from database
    Then Webpage should contain "Tạo mới" button

### Verify the funtion of changing data information
CT_13 Verify the changing "Tên loại" field
    [Tags]                                                                        ChangeInfo 
    Create a test account with "category" type
    When Click on the "Sửa" button in the "_@Tên loại@_" item line
    When Enter "test name" in "Tên loại" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    Then "_@Tên loại@_" should be visible in item line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line

CT_14 Verify the changing "Mã" field
    [Tags]                                                                        ChangeInfo 
    Create a test account with "category" type
    When Click on the "Sửa" button in the "_@Tên loại@_" item line
    When Enter "number" in "Mã" with "_RANDOM_"
    When Click "Lưu lại" button
    Then User look message "Success" popup
    When Click on the "Sửa" button in the "_@Tên loại@_" item line
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    
CT_15 Verify the changing with the existed "Tên loại"
    [Tags]                                                                        ChangeInfo 
    ${Cate1}=                                                  Create a test account with "category" type
    Create a test account with "category" type
    When Click on the "Sửa" button in the "${Cate1}" item line
    When Enter "test name" in "Tên loại" with "_@Tên loại@_"
    When Click "Lưu lại" button
    Then User look message "Tên danh mục đã tồn tại" popup
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    When Click on the "Xóa" button in the "${Cate1}" item line

CT_16 Verify the changing with the existed "Mã"
    [Tags]                                                                        ChangeInfo 
    ${Cate1}=                                                  Create a test account with "category" type
    Create a test account with "category" type
    When Click on the "Sửa" button in the "${Cate1}" item line
    When Enter "text" in "Mã" with "_@Mã@_"
    When Click "Lưu lại" button
    Then User look message "Code đã tồn tại" popup
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    When Click on the "Xóa" button in the "${Cate1}" item line

### Verify the go back function of buttons in change information's page
CT_17 Check the "Đóng lại" button in edit infomation page
    [Tags]                                                                        changeinfo                                             Button
    Create a test account with "category" type
    When Click on the "Sửa" button in the "_@Tên loại@_" item line
    When Click "Đóng lại" button
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contains the list account from database
    Then Webpage should contain "Tạo mới" button

CT_18_01 Check the left arrow icon ("Trở lại" button) in edit infomation page
    [Tags]                                                                        changeinfo                                             Button
    Create a test account with "category" type
    When Click on the "Sửa" button in the "_@Tên loại@_" item line
    When Click on the left arrow icon
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contains the list account from database
    Then Webpage should contain "Tạo mới" button

CT_18_02 Check the (left arrow icon) "Trở lại" button in edit infomation page
    [Tags]                                                                        changeinfo                                             Button
    Create a test account with "category" type
    When Click on the "Sửa" button in the "_@Tên loại@_" item line
    When Click on the left arrow icon
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    Then Confirm locating exactly in "Quản lý dữ liệu" page
    Then Webpage should contains the list account from database
    Then Webpage should contain "Tạo mới" button

### Verify the delete data function
CT_19 Verify the delete data function
    [Tags]                                                                                     Delete                                                                        
    Create a test account with "category" type
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    Then User look message "Success" popup
    Then "_@Tên loại@_" should not be visible in item line

CT_20 Verify the cancel action button when delete data
    [Tags]                                                                                     Delete                                                                        
    Create a test account with "category" type
    When Click on the "Xóa" button in the "_@Tên loại@_" item line with cancel
    Then "_@Tên loại@_" should be visible in item line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    # Then User look message "Success" popup

CT_21 Check to delete category that still having data inside
    [Tags]                                                                                     Delete                                                                        
    Create a test account with "category" type
    When Click "Thêm mới dữ liệu" button
    When Click select "Chuyên mục" with "_@Tên loại@_"
    When Enter "number" in "Thứ tự" with "_RANDOM_"
    When Enter "test name" in "Tiêu đề" with "_RANDOM_"
    When Enter "paragraph" in textarea "Mô tả" with "_RANDOM_"
    When Enter "paragraph" in textarea "Nội dung" with "_RANDOM_"
    When Click "Lưu lại" button
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
    Then User look message "Danh mục có dữ liệu không thể xóa" popup
    When Click on the "Xóa" button in the "_@Tiêu đề@_" table line
    When Click on the "Xóa" button in the "_@Tên loại@_" item line
             
*** Keywords ***
Compare Strings Ignoring Leading and Trailing Whitespaces
    [Arguments]    ${actual}    ${expected}
    ${actual_stripped}=    Set Variable    ${actual.strip()}
    Should Be Equal As Strings    ${actual_stripped}    ${expected}

Go to "${page}" page
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    ${cnt}=    Get Length    ${page}
    IF    ${cnt} > 0 and '${page}' == 'Order'
        Click "Order" sub menu to "/order"
    ELSE IF    ${cnt} > 0 and '${page}' == 'Quản lý dữ liệu'
        Click "Quản lý dữ liệu" sub menu to "/data"
    END

Go to page create account "${name}" with "${url}"
    Login to admin
    Click "QUẢN LÝ DANH MỤC" menu
    Click "${name}" sub menu to "${url}"
    Click "Tạo mới" button

Create a test account with "${type}" type
    ${condition}=    Run Keyword And Return Status    Confirm locating exactly in "Quản lý dữ liệu" page
    IF    '${condition}' == 'True'
        Click "Tạo mới" button
    ELSE
        Go to page create account "Quản lý dữ liệu" with "/data"
    END
    Enter "test name" in "Tên loại" with "_RANDOM_"
    ${text}=    Check Text    _@Tên loại@_
    ${name}=    Set Variable    ${text}
    Enter "number" in "Mã" with "_RANDOM_"
    Click "Lưu lại" button
    User look message "Success" popup
    RETURN    ${name}
