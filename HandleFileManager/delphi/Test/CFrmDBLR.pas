unit CFrmDBLR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, HKCEdit, Mask, DBCtrls, ExtCtrls, Buttons,
  Spin, Db, DBTables, cfrmdatabase, cdatetime, ComCtrls, cxContainer,
  Variants, uTitleForm, AAFont, AACtrls, AdvPanel,
  Shader, AdvGlowButton, CFrameBRJBXX, Grids, BaseGrid, AdvGrid, DBAdvGrid,
  RzEdit, RzDTP, CFrmDataZYBR, CFrmDataZYBRDB, UCard_TLB, ADODB, uEditPopBox,
  RzButton, RzRadChk, uBaseFrame, uCrypt, cfrmmminput,DBGridEh, GridsEh, Menus,
  AdvEdit, GR32_Image_ml, uMlSkinCtrls, uMlCustomButton, uMlSkinColorButton,
  uMlSkinCornerButton, uMlSkinNCCtrlBase, uMlSkinNCButton, uMlStdCtrl,
  uMlSkinForm;

type
  TFrmDBLR = class(TTitleForm)
    DSDB: TDataSource;
    FrmeBRJBXX: TFrmebyjbxx;
    AdvPanel1: TAdvPanel;
    Label200: TLabel;
    LblYlkye: TLabel;
    LblSjh: TLabel;
    lblzph: TLabel;
    EdtDBR: TRzEdit;
    EdtDBSM: TRzEdit;
    EdtDBSJ: TRzDateTimePicker;
    EdtDBJE: TRzNumericEdit;
    AdvPanel2: TAdvPanel;
    DBAdvGrid1: TDBGridEh;
    EdtDBSJ1: TRzDateTimePicker;
    EdtDBYXQ: TRzDateTimePicker;
    EdtDBYXQ1: TRzDateTimePicker;
    CmdCancel: TAdvGlowButton;
    CmdSave: TAdvGlowButton;
    CmdZF: TAdvGlowButton;
    EdtPopDBR: TAdoEditPopBox;
    CB1: TRzCheckBox;
    QryTemp: TADOQuery;
    CBZZBDB: TRzCheckBox;
    MainMenu1: TMainMenu;
    EdpDBSM: TADOEditPopBox;
    procedure EdtDBSMKeyPress(Sender: TObject; var Key: Char);
    procedure CBZZBDBClick(Sender: TObject);
    procedure EdtDBSJChange(Sender: TObject);
    procedure EdtPopDBRExit(Sender: TObject; isChecked: Boolean;
      var CanExit: Boolean);
    procedure BtnPrintClick(Sender: TObject);
    procedure FrmeBRJBXXEdtPopZYHChecked(Sender: TObject);
    procedure FrmeBRJBXXEdtPopZYHPressEnter(Sender: TObject; isChecked: Boolean;
      var CanExit: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmdSaveClick(Sender: TObject);
    procedure CmdZFClick(Sender: TObject);
    procedure CmdCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CB1Click(Sender: TObject);
    procedure FrmeBRJBXXEdtZYHChange(Sender: TObject);
    procedure EdtDBSJKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPopDBRChecked(Sender: TObject);
    procedure EdtDBYXQChange(Sender: TObject);
    procedure DBAdvGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);


  private
    { Private declarations }
    AZYBR: TZYBR;
    AZYBRDB: TZYBRDB;
    ACard: IUniteCard;
    CDBRMM: string; //担保人密码
    IDBTS:Integer;
    IDBXC:Integer;  //担保限次
    procedure ClearAll(ITYPE: integer = 0);
    function CheckData: boolean;
    function SaveData: boolean;
    function ReflashDataSet: Boolean;
    function PrintDBXX: Boolean;
    function CheckDBRMM: boolean;
    function GetDBRXX(CGH: string): Boolean;
    function GetDBZE(var MDBJE:Currency;BQB:Boolean):Boolean;//
    function GetDBZEXZBYDBR(var MDBJE:Currency):Boolean;//限制担保人担保金额限制
    function SaveZF:Boolean;
    function GetCheckState(var BSPZT:Boolean):Boolean;//取担保审批状态
  public
    CallCode: integer;
    procedure WriteToZYBRDB;
    function WriteToZYBRDBZF: boolean;
    procedure setimetoform;
    { Public declarations }
  end;

var
  FrmDBLR: TFrmDBLR;

implementation
uses uBaseVar, uBaseShare, CFormMessagebox, CFunction, uDBopr, uFormExt;
{$R *.DFM}


procedure TFrmDBLR.BtnPrintClick(Sender: TObject);
var
  CSQL: string;
begin
  inherited;
  if not CheckData then Exit;


end;

procedure TFrmDBLR.CB1Click(Sender: TObject);
begin
  inherited;
  EdtDBYXQ.Enabled := CB1.Checked;
  EdtDBYXQ1.Enabled := CB1.Checked;
end;

procedure TFrmDBLR.CBZZBDBClick(Sender: TObject);
begin
  inherited;
  EdtDBJE.Enabled:=True;
  if CBZZBDB.Checked then
  begin
    EdtDBJE.Value:=0;
    CB1.Checked:=True;
    EdtDBJE.Enabled:=False;
    EdtDBYXQ.DateTime :=RDate() + 1;
    EdtDBYXQ1.DateTime :=RDate() + 1;
  end;
end;

procedure TFrmDBLR.setimetoform;
begin
  with imectls do begin
    add(edtDBR);
    ADD(EDTDBSM);
  end;
end;

function TFrmDBLR.CheckData: boolean;
var BSPZT:Boolean;
    MDBJE:Currency;
    CSQL : string;
begin
  Result := False;
  if (trim(FrmeBRJBXX.EdtZYH.Text) = '') or (FrmeBRJBXX.EdtXM.Text = '') then
  begin
    ShowMessageBox('请输入住院号!    +1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
    FrmeBRJBXX.EdtZYH.SetFocus;
    Exit;
  end;
  if Trim(Edtdbr.Text) = '' then
  begin
    ShowMessageBox('请输入担保人姓名!    +1+12+|', '错误', mb_Ok + MB_ICONINFORMATION);
    Edtdbr.SetFocus;
    exit;
  end;
  if Psystem.GetXtchcsExI('ZYRYDBRBXXZZDSJ1', 0) = 1 then//ZYRYDBRBXXZZDSJ此参数乱填会默认第一个
  begin
    CSQL := 'SELECT * FROM TBZDDBR where BEnable=1 and CMC=' + QuotedStr(Edtdbr.Text);
    if Psystem.GetXtchcsExI('IZYDBLRCZYKZ', 0) = 1 then
    begin
      CSQL := 'select * from TBMZJMCZYQXKZ where BENABLE=1 and CXM=' + QuotedStr(Edtdbr.Text);
    end;
    if not PDbOpr.ExecAdoSql(QryTemp, CSQL, False) then Exit;
    if QryTemp.IsEmpty then
    begin
      ShowMessageBox('该担保人不存在，请检查!    +1+12+|', '错误', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;
  end;
  if trunc(Edtdbsj.datetime) + frac(edtdbsj1.datetime) > now then
  begin
    ShowMessageBox('担保时间不能大于当前时间    +1+12+|', '错误', mb_ok + MB_ICONINFORMATION);
    edtdbsj.SetFocus;
    exit;
  end;

  if trunc(Edtdbsj.datetime) + frac(edtdbsj1.datetime) < trunc(StrToDateTime(FrmeBRJBXX.EdtRYSJ.Text)) then
  begin
    ShowMessageBox('担保时间不能小于于入院时间    +1+12+|', '错误', mb_ok + MB_ICONINFORMATION);
    edtdbsj.SetFocus;
    exit;
  end;

  if (edtdbje.Value <= 0) and (not CBZZBDB.Checked) then
  begin
    ShowMessageBox('请输入正确的担保金额(担保金额不能小于零)！    +1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
    edtdbje.Value := 0;
    if edtdbje.CanFocus then edtdbje.SetFocus;
    exit;
  end;
  if Cb1.checked then
  begin
    if trunc(edtdbyxq.datetime) + frac(edtdbyxq1.datetime) <= trunc(edtdbsj.datetime) + frac(edtdbsj1.datetime) then
    begin
      ShowMessageBox('担保截止时间需大于担保时间    +1+12+|', '错误', mb_ok + MB_ICONINFORMATION);
      edtdbyxq.setfocus;
      exit;
    end;
  end;
  if CBZZBDB.Checked and (not CB1.Checked) then
  begin
    ShowMessageBox('总值班担保需要设置有效期! +1+12+|', '错误', mb_ok + MB_ICONINFORMATION);
    exit;
  end;
  if Psystem.GetXtchcsExI('IZYDBYXQXZ', 0) <> 0 then
  begin
    if CB1.Checked
      and (trunc(EdtDBYXQ.DateTime) + Frac(EdtDBYXQ1.DateTime) - Psystem.GetXtchcsExI('IZYDBYXQXZ', 0) > trunc(EdtDBSJ.DateTime) + Frac(EdtDBSJ1.DateTime)) then
    begin
      ShowMessageBox('担保有效期时间不能超过担保时间' + inttoStr(Psystem.GetXtchcsExI('IZYDBYXQXZ', 0)) + '天!+1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
      EdtDBYXQ.SetFocus;
      Exit;
    end;
  end;
  if Psystem.GetXtchcsExI('MZYDBJEXZ', 0) <> 0 then
  begin
    if (EdtDBJE.Value > Psystem.GetXtchcsExI('MZYDBJEXZ', 0)) then
    begin
      ShowMessageBox('担保金额不能大于医院规定担保金额:' + FloattoStr(Psystem.GetXtchcsExI('MZYDBJEXZ', 0)) + '!+1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
      EdtDBJE.SetFocus;
      Exit;
    end;
  end;
  if Psystem.GetXtchcsExI('IZYDBCSXZ') <> 0 then
  begin
    if DSDB.DataSet.RecordCount >= Psystem.GetXtchcsExI('IZYDBCSXZ') then
    begin
      ShowMessageBox('医院规定担保次数不能超过' + InttoStr(Psystem.GetXtchcsExI('IZYDBCSXZ')) + '次，不能再次担保！    +1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;
  end;
  if Psystem.GetXtchcsExI('IZYBRDBCZYXEXC', 0) = 1 then
  begin
    if DSDB.DataSet.RecordCount >= IDBXC then
    begin
      ShowMessageBox('该操作员担保次数超过限定的' + InttoStr(IDBXC) + '次，不能再次担保！    +1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;
    if not GetDBZE(MDBJE,True) then ErrorProcess(ErrorInfo,True);
    if MDBJE + EdtDBJE.Value>AZYBRDB.MDBXE then
    begin
      ShowMessageBox('该患者的在担保总额超过了操作员允许的担保总额【' + CurrToStr(AZYBRDB.MDBXE) + '】元，不能再次担保！    +1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;
  end;
  if not CheckDBRMM then Exit;
  //公安人民医院住院担保总额限制
  if Psystem.GetXtchcsExI('GARMYYZYDBZEXZ',0)=1 then
  begin
    if AZYBR.MDBJE+EdtDBJE.Value>AZYBR.ZYBRFY.MYJJE then
    begin
      ShowMessageBox('该患者的担保总额超过了预交金总额,不能再次担保！+1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;
    //公安人民医院住院担保总额限制总金额
    if AZYBR.MDBJE+EdtDBJE.Value>Psystem.GetXtchcsExI('GARMYYZYDBZEXZZJE',0) then
    begin
      ShowMessageBox('该患者的担保总额超过了限制金总额['+Psystem.GetXtzhcsEx('GARMYYZYDBZEXZZJE','')+'],不能再次担保！+1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;
  end;
  //黔江民族医院 病人的担保总额不能超过  病人总费用*催款比例-预交金总额
  if Psystem.GetXtchcsExI('IZYBRDBZEXZ',0) = 1 then
  begin
    if AZYBR.MDBJE+EdtDBJE.Value>(AZYBR.ZYBRFY.MSJFY * AZYBR.FCKBL - AZYBR.ZYBRFY.MYJJE) then
    begin
      ShowMessageBox('该患者的担保总额超过了总费用减预交金额的值,不能再次担保！+1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;
  end;
  //遂宁中心医院 病人的担保总额限制，但经过审批的病人可以在超出后再加
  if Psystem.GetXtchcsExI('IZYDBZETSXZ',0)>0 then
  begin
    if AZYBR.MDBJE+EdtDBJE.Value>Psystem.GetXtchcsExI('IZYDBZETSXZ',0) then
    begin
      if not GetCheckState(BSPZT) then ErrorProcess(ErrorInfo,True);
      if not BSPZT then
      begin
        ShowMessageBox('该患者的担保总额超过了允许担保额上限【'+Psystem.GetXtzhcsEx('IZYDBZETSXZ','')+'】,不能再次担保！+1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
        Exit;
      end;
    end;
  end;
  //八一康复医院 临床(护士站)担保总额限制(按系统来统计担保费用)
  if (Psystem.GetXtchcsExI('IZYLCDBZEXZ',0)>0) then
  begin
    if not GetDBZE(MDBJE,False) then ErrorProcess(ErrorInfo,True);
    if MDBJE+EdtDBJE.Value>Psystem.GetXtchcsExI('IZYLCDBZEXZ',0) then
    begin
      ShowMessageBox('该患者的在本系统中担保总额超过了允许担保额上限【'+Psystem.GetXtzhcsEx('IZYLCDBZEXZ','')+'】,不能再次担保！+1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;
  end;
  //住院病人限制担保人担保总额
  if (Psystem.GetXtchcsExI('ZYBRXZDBRDBZE',0)>0) then
  begin
    MDBJE:=EdtDBJE.Value;
    if not GetDBZEXZBYDBR(MDBJE) then ErrorProcess(ErrorInfo,True);
    if MDBJE>Psystem.GetXtchcsExI('ZYBRXZDBRDBZE',0) then
    begin
      ShowMessageBox('担保人【'+EdtDBR.Text+'】为该患者担保的总额过了其允许担保额度限制【'+Psystem.GetXtzhcsEx('ZYBRXZDBRDBZE','')+'】,不能再次担保！+1+12+|', '提示', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;
  end;
  result := true;
end;

function TFrmDBLR.CheckDBRMM: boolean;
begin
  Result := false;
  //担保录入西藏需求
  if Psystem.GetXtchcsExI('IZYDBLRCZYKZ', 0) = 0 then
  begin
    Result := True;
    Exit;
  end;
  if not GetDBRXX(AZYBRDB.CDBRBM) then
  begin
    Application.MessageBox('未找到该操作员信息', '警告', mb_Ok + mb_IconExclamation);
    Exit;
  end;
  if not MMinput(CDBRMM) then
  begin
    Application.MessageBox('密码错误！', '警告', mb_Ok + mb_IconExclamation);
    Exit;
  end;
  Result := True;
end;

function TfrmDBLR.WriteToZYBRDBZF: boolean;
begin
  result := false;
  if dsdb.DataSet.IsEmpty or not DSDB.DataSet.Active then exit;
  with dsdb.DataSet do
  begin
    AZYBRDB.CDBBH := fieldbyname('CDBBH').AsString;
    AZYBRDB.CZYH := fieldbyname('CZYH').AsString;
    AZYBRDB.IZYBQ := AZYBR.IZYBQ;
    AZYBRDB.DLRRQ := FieldByName('DLRRQ').AsDateTime;
    AZYBRDB.MDBJE := fieldbyname('MDBJE').AsCurrency;
  end;
  Result := true;
end;

procedure TfrmDBLR.WriteToZYBRDB;
begin
  with azybrdb do
  begin
    CZYH := azybr.CZYH;
    CXM := azybr.CXM;
    CXB := azybr.CXB;
    ISFZL := azybr.ISFZL;
    CSFZL := azybr.CSFZL;
    IZYBQ := azybr.IZYBQ;
    CZYBQ := azybr.CZYBQ;
    IZYKS := azybr.IZYKS;
    CZYKS := azybr.CZYKS;
    DDBSJ := trunc(EDTDBSJ.DATE) + frac(edtdbsj1.datetime);
    if not CB1.Checked then
      DDBYXQ := 0
    else
      DDBYXQ := trunc(edtdbyxq.datetime) + frac(edtdbyxq1.DateTime);
    MDBJE := EDTDBJE.VALUE;
    CDBSM := EDTDBSM.Text;
    CDBR := trim(EDTDBR.TEXT);
    DRYSJ := azybr.DRYSJ;
    BYXQ := CB1.Checked;
    if CBZZBDB.Checked then
    begin
      CDBSM:='总值班担保:'+CDBSM;
      CDBR:= '@'+CDBR;
    end;
  end;
end;

procedure TFrmDBLR.ClearAll(ITYPE: integer);
var FHXX :array [0..10] of string;
begin
  IDBTS:=0;
  DBAdvGrid1.DataSource.DataSet :=nil;
  EdtDBR.Clear;
  EdtDBJE.Value := 0.00;
  EdtDBSM.Clear;
  EdtDBSJ.DateTime := RDate;
  EdtDBSJ.DateTime := RDate;
  EdtDBYXQ.DateTime := RDate + 1;
  EdtDBYXQ.DateTime := RDate;
  if ITYPE = 1 then
  begin
    FrmeBRJBXX.Clear;
  end;

  if ITYPE = 0 then
  begin
    FrmeBRJBXX.EdtBQ.Clear;
    FrmeBRJBXX.IBQ := 0;
    FrmeBRJBXX.EdtZYH.Clear;
    AZYBR.Reset;
    if FrmeBRJBXX.EdtZYH.CanFocus then FrmeBRJBXX.EdtZYH.SetFocus;
  end;
  if Psystem.GetXtchcsExI('ZYDBRZWCZYZS', 0) = 1 then
  begin
    EdtDBR.Text := Pworker.sXM;
  end;
  if Psystem.GetXtzhcsEx('CZYDBLRMRCZYANDJE','') <> '' then
  begin
    DataFJ(Psystem.GetXtzhcsEx('CZYDBLRMRCZYANDJE',''),fhxx,'|');
    EdtDBR.Text :=FHXX[1];
    IF FHXX[2] <> '' then
    begin
      EdtDBJE.Value :=StrToFloat(FHXX[2]);
    end;
  end;
end;

procedure TFrmDBLR.CmdCancelClick(Sender: TObject);
begin
  inherited;
  ClearAll;
end;

procedure TFrmDBLR.CmdSaveClick(Sender: TObject);
var
  CDBRY : string; //担保人或者是操作员
begin
  if Psystem.GetXtchcsExI('IZYDBRXE', 0) = 1 then
  begin
    EdtPopDBR.Active:=False;
    EdtPopDBR.DoChecked('CMC',EdtDBR.Text);
    EdtPopDBR.Active:=True;
  end;
  if not CheckData then Exit;
  WriteToZYBRDB; //准备担保人信息
  AZYBRDB.CDBBH := PWORKER.GetSYSNUMBER2('ZYDBBH', 1, '00');
 
  if (Psystem.GetXtchcsExI('IZYDBRXE', 0) = 1) or (Psystem.GetXtchcsExI('IZYBRDBCZYXEXC', 0) = 1) then
  begin
    if (TRIM(EdtDBR.Text) <> '') and (EdtDBJE.Value > 0.0) then
    begin
      if AZYBRDB.MDBXE <> 0 then
      begin
        if (AZYBRDB.MDBYE <= 0) or (AZYBRDB.MDBYE < EdtDBJE.Value) then
        begin
          if Psystem.GetXtchcsExI('IZYDBRXE', 0) = 1 then CDBRY := '担保人' else CDBRY := '操作员';
          ShowMessageBox('担保金额不能大于' + CDBRY + '当前单笔限额【' + CurrToStr(AZYBRDB.MDBYE) + '】元!+1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
          EdtDBJE.SetFocus;
          Exit;
        end;
      end;
    end;
  end;
  if (AZYBRDB.CDBBH = '') or (AZYBRDB.CDBBH = '-1') or (uppercase(AZYBRDB.CDBBH) = 'ERROR') then
  begin
    Application.MessageBox('生成住院担保流水号出错,不能办理住院!', '错误', MB_OK + MB_ICONERROR);
    Exit;
  end;
  if PDbOpr.InTransaction(2) then PDbOpr.Rollback(2);
  PDbOpr.StartTransaction(2);
  if not AZYBRDB.ADD then
  begin
    PDbOpr.Rollback(2);
    Application.MessageBox(pchar(ErrorInfo), '错误', MB_OK + MB_ICONERROR);
    Exit;
  end;
  PDbOpr.Commit(2);
  if Psystem.GetXtchcsExI('DBXXDYGN', 0) = 1 then
  begin
    if not PrintDBXX then Exit;
  end;
  ClearAll;
//  ShowMessageBox('担保录入保存成功!+1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
  //担保人表格刷新

end;

procedure TFrmDBLR.CmdZFClick(Sender: TObject);
var
  sCZFYY:string;
begin
  inherited;
  if Psystem.GetXtchcsExI('USEZYBRDBZFKZ',0) = 1 then
  begin
    sCZFYY := Trim(InputBox('请输入作废原因','作废原因不能为空',''));
    if sCZFYY = '' then
    begin
      ShowMessageBox('作废原因不能为空！ +1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    azybrdb.CZFYY := sCZFYY;
  end;
  if DSDB.DataSet = nil then Exit;
  if DSDB.DataSet.FieldbyName('CZF').AsString = '已作废' then
  begin
    ShowMessageBox('该担保记录已作废过,不能再次作废！ +1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  IF Psystem.GetXtchcsExI('UseECBXBL',0) = 1 THEN
  begin
    if DSDB.DataSet.FieldbyName('IBZ').AsString = '1' then
    begin
      ShowMessageBox('二次报销自动生成的担保数据不允许作废,若要做废请修改其二次报销情况！ +1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;
  if ShowMessageBox('你确定要作废担保编号为' + AZYBRDB.CDBBH + '的担保吗?+1+12+|', '提示', MB_YESNO + MB_ICONINFORMATION) = IDNO then Exit;
  if not writetozybrdbzf then exit; //准备担保信息住院号和担保号
  if PDbOpr.InTransaction(2) then PDbOpr.Rollback(2);
  PDbOpr.StartTransaction(2);
  if not SaveZF then
  begin
    PDbOpr.Rollback(2);
    Application.MessageBox(pchar(ErrorInfo), '错误', MB_OK + MB_ICONERROR);
    Exit;
  end;
  PDbOpr.Commit(2);
//  ShowMessageBox('担保编号为' + AZYBRDB.CDBBH + '的担保作废成功!+1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
  //担保人表格刷新
  ClearAll(1);
  if not ReflashDataSet then Exit;
end;

procedure TFrmDBLR.DBAdvGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var aDBGrid: TDBGridEh;
begin
  inherited;
  aDBGrid := Sender as TDBGridEh;
  if not DSDB.DataSet.FieldByName('BZF').AsBoolean  then
    aDBGrid.Canvas.Font.Color := clBlack
  else
    aDBGrid.Canvas.Font.Color := clRed;

  aDBGrid.Canvas.FillRect(Rect);
  aDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, STATE);
end;

procedure TFrmDBLR.EdtDBSJChange(Sender: TObject);
begin
  inherited;
  //使用住院担保的有效天数
  if Psystem.GetXtchcsExI('USEZYDBRYXTS',0)=1 then
  begin
    if IDBTS>0 then
    begin
      EdtDBYXQ.Date:=EdtDBSJ.Date+IDBTS;
    end;
  end;
end;

procedure TFrmDBLR.EdtDBSJKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    Perform(CM_DIALOGKEY, Byte(VK_TAB), 0);
end;

procedure TFrmDBLR.EdtDBSMKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Psystem.GetXtchcsExI('ZYBRDBLRSMSYZDXZ',0)=0 then
  begin
    if Key=#13 then 
      if CmdSave.CanFocus then CmdSave.SetFocus;
  end;
end;

procedure TFrmDBLR.EdtDBYXQChange(Sender: TObject);
begin
  inherited;
  //担保有效期自动从年跳转到月
  if not EdtDBYXQ.DroppedDown then
  EdtDBYXQ.Perform(WM_KEYDOWN, Byte(VK_RIGHT), 0);
end;

procedure TFrmDBLR.EdtPopDBRChecked(Sender: TObject);
begin
  inherited;
  IDBTS:=0;
  if Psystem.GetXtchcsExI('IZYDBRXE', 0) = 1 then
  begin
    AZYBRDB.MDBXE := EdtPopDBR.ValueByName('MDBXE').AsCurrency;
    AZYBRDB.MDBYE := EdtPopDBR.ValueByName('MDBYE').AsCurrency;
    if Psystem.GetXtchcsExI('IZYDBLRCZYKZ', 0) = 1 then
    begin
      AZYBRDB.CDBRBM := EdtPopDBR.ValueByName('CUID').AsString;
      AZYBRDB.CDBRMC := EdtPopDBR.ValueByName('CXM').AsString;
    end
    else
    begin
      AZYBRDB.CDBRBM := EdtPopDBR.ValueByName('CBH').AsString;
      AZYBRDB.CDBRMC := EdtPopDBR.ValueByName('CMC').AsString;
    end;

  end;
  //住院担保金额默认担保人限额
  if Psystem.GetXtchcsExI('ZYDBJEMRDBRXE', 0) = 1 then
  begin
    EdtDBJE.Value:=  EdtPopDBR.ValueByName('MDBXE').AsCurrency;
    EdtDBJE.Max:=EdtPopDBR.ValueByName('MDBXE').AsCurrency;
  end;
  //如果没有使用担保限额 此处需要赋值担保人编码
  if Psystem.GetXtchcsExI('IZYDBLRCZYKZ', 0) = 1 then
  begin
    AZYBRDB.CDBRBM := EdtPopDBR.ValueByName('CUID').AsString;
  end;
  //使用住院担保的有效天数
  if (Psystem.GetXtchcsExI('IZYDBLRCZYKZ', 0) = 0) and (Psystem.GetXtchcsExI('USEZYDBRYXTS',0)=1) then
  begin
    IDBTS:=0;
    CB1.Checked:=False;
    if not VarIsNull(EdtPopDBR.ValueByName('IDBTS').Value) then
    begin
      IDBTS:= EdtPopDBR.ValueByName('IDBTS').AsInteger;
    end;
    if IDBTS>0 then
    begin
      CB1.Checked:=True;
      CB1.Enabled:=False;
      EdtDBYXQ.DateTime:=EdtDBSJ.DateTime+IDBTS;
      EdtDBYXQ.Enabled:=False;
    end;
  end;
end;

procedure TFrmDBLR.EdtPopDBRExit(Sender: TObject; isChecked: Boolean;
  var CanExit: Boolean);
begin
  inherited;
  if not isChecked then
  begin
    IDBTS:=0;
    //使用住院担保的有效天数
    if Psystem.GetXtchcsExI('USEZYDBRYXTS',0)=1 then
    begin
      EdtDBYXQ.Enabled:=CB1.Checked;
    end;
  end;
end;

procedure TFrmDBLR.FormCreate(Sender: TObject);
var IYf:Integer;
begin
  inherited;
  ACard := CoUniteCard.Create;
  AZYBR := TZYBR.Create(self);
  AZYBRDB := TZYBRDB.Create(self);
  AZYBR.ZYTYPE := TTZYBR;
  DosMove.Active := True;
  DosMove.NotPControls.Add(FrmeBRJBXX.EdtZYH);
  DosMove.NotPControls.Add(FrmeBRJBXX.EdtBQ);
  DosMove.NotPControls.Add(EdtDBSJ);
  DosMove.NotPControls.Add(EdtDBSJ1);
  DosMove.NotPControls.Add(EdtDBYXQ);
  DosMove.NotPControls.Add(EdtDBYXQ1);
  DosMove.NotPControls.Add(EdtDBR);
  DosMove.NotPControls.Add(EdtDBSM);
  EdtDBSJ.DateTime := RDate;
  EdtDBSJ.DateTime := RDate;
  IYf:=Psystem.GetXtchcsExI('ZYDBMRDBYXQYF', 0);
  if (IYf<>0)  then
  begin
       EdtDBYXQ.Date :=IncMonth(Now,+IYf);
  end else
  begin
       EdtDBYXQ.DateTime := RDate + 1;
  end;
//  EdtDBYXQ.DateTime := RDate;
  IMECtls.Add(EdtDBR);
  IMECtls.Add(EdtDBSM);
  if Psystem.GetXtchcsExI('IZYDBLRCZYKZ', 0) = 1 then
  begin
    EdtPopDBR.SQL.Text := 'select * from TBMZJMCZYQXKZ where BENABLE=1';
    EdtPopDBR.Fields[0].FieldName := 'CUID';
    EdtPopDBR.Fields[1].FieldName := 'CXM';
    EdtPopDBR.KeyField := 'CXM';
  end;
  if (SysNo = '21') and (PSystem.GetXtchcsExI('ZYBRDBLRDBRXZDLKS') = 1) then
  begin
    EdtPopDBR.SQL.Clear;
    EdtPopDBR.SQL.Add('SELECT A.CBH,A.CMC FROM TBZDDBR A,TBZDZYYS B WHERE a.BENABLE=1 AND a.CBH=CONVERT(VARCHAR(10), B.IBM)');
    EdtPopDBR.SQL.Append(Format(' AND B.CKSBM=%d',[pWorker.iKS]));
  end;
  //住院入院担保人必须选择字典数据
  if Psystem.GetXtchcsExI('ZYRYDBRBXXZZDSJ', 0) = 1 then
  begin
    EdtPopDBR.MustInDictionary := True;
  end;
end;

procedure TFrmDBLR.FormDestroy(Sender: TObject);
begin
  ACard := nil;
  AZYBR.Free;
  AZYBRDB.Free;
  inherited;
end;

procedure TFrmDBLR.FormShow(Sender: TObject);
var FHXX :array [0..10] of string;
  CSQL : string;
begin
  inherited;
  EdpDBSM.FocusControl:=nil;
  //住院担保录入说明使用字典选择
  if Psystem.GetXtchcsExI('ZYBRDBLRSMSYZDXZ',0)=1 then
  begin
    EdpDBSM.FocusControl:=EdtDBSM;
  end;
  //三0二医院住院担保使用总值班担保功能
  if Psystem.GetXtchcsExI('ZYDBSYZZBDB_302', 0) = 1 then
  begin
    CBZZBDB.Visible:=True;
  end;
  if Psystem.GetXtchcsExI('ZYDBRZWCZYZS', 0) = 1 then
  begin
    EdtDBR.ReadOnly := True;
    EdtDBR.Text := Pworker.sXM;
    EdtPopDBR.FocusControl := nil;
  end;
  if Psystem.GetXtzhcsEx('CZYDBLRMRCZYANDJE','') <> '' then
  begin
    DataFJ(Psystem.GetXtzhcsEx('CZYDBLRMRCZYANDJE',''),fhxx,'|');
    EdtDBR.Text :=FHXX[1];
    IF FHXX[2] <> '' then
    begin
      EdtDBJE.Value :=StrToFloat(FHXX[2]);
    end;
    EdtPopDBR.FocusControl := nil;
  end;
  if Psystem.GetXtchcsExI('IZYDBYXQXZ', 0) <> 0 then
  begin
    CB1.Checked := true;
    CB1.Enabled := false;
  end;
  FrmeBRJBXX.FilterStr := '';
  with FrmeBRJBXX do
  begin
    //住院分院模式不显示其它分院病人
    if Psystem.GetXtchcsExI('ZYFYMSBXSQTYYBR', 0) = 1 then
    begin
      FilterStr := FilterStr + ' and IZYBQ in(select IBM from TBZDBQ with(nolock) where 1=1 ' + Pworker.ConditionLimitByHosp + ')';
    end;
    EdtPopZYH.SQL.Text := 'Select CZYH 住院号,CXM 姓名,CXB 性别,CSFZL 收费种类,CZYBQ 病区,CZYCW 床位'
      + ',IZYBQ 病区编码,CPYM 拼音码 from VTBZYBR where 1=1 ';

    EdtPopZYH.SQL.Text:=EdtPopZYH.SQL.Text+FilterStr+' order by CZYH';
    EdtPopBQ.SQL.Text :='select IBM 编码,CMC 名称,CPYM 拼音码 from  TBZDBQ where 1=1 '+pWorker.ConditionLimitByHosp;
  end;
  if CallCode = 1 then
  begin
    with FrmeBRJBXX do
    begin
      EdtPopBQ.SQL.Clear;
      EdtPopBQ.SQL.Text := 'select IBM 编码,CMC 名称,CPYM 拼音码 from  TBZDBQ where ' + pworker.GetBqFilter('ibm');
      EdtPopBQ.SQL.Add(Pworker.ConditionLimitByHosp);
      FilterStr := ' and ' + pworker.GetBqFilter('izybq');
      EdtPopZYH.SQL.Text := 'Select CZYH 住院号,CXM 姓名,CXB 性别,CSFZL 收费种类,CZYBQ 病区,IZYBQ 病区编码,CPYM 拼音码,''' + psystem.GetXtzhcsEx('IZYBRJBXXCWQZSTR', '') + '''+CZYCW 床位 from VTBZYBR where 1=1 ' + FilterStr + Order;
    end;
  end;
  if Psystem.GetXtchcsExI('IZYBRDBCZYXEXC', 0) = 1 then
  begin
    CSQL := 'select CDBBQ,ICSXZ,MDBXE,MDBYE from TBZDCZYDBQX where CGH=' + QuotedStr(pWorker.sGH);
    if not PDbOpr.ExecSql(QryTemp,CSQL,False) then Exit;
    IDBXC :=  QryTemp.Fields[1].AsInteger;
    AZYBRDB.MDBXE := QryTemp.Fields[2].AsCurrency;
    AZYBRDB.MDBYE := QryTemp.Fields[3].AsCurrency;
    FrmeBRJBXX.EdtPopBQ.SQL.Text := 'select IBM 编码,CMC 名称,CPYM 拼音码 from TBZDBQ where IBM IN (' + QryTemp.Fields[0].AsString +')';
    FrmeBRJBXX.EdtPopZYH.SQL.Text := 'select CZYH 住院号,CXM 姓名,CXB 性别,CSFZL 收费种类,CZYBQ 病区,CZYCW 床位,IZYBQ 病区编码,CPYM 拼音码  from VTBZYBR where IZYBQ IN (' + QryTemp.Fields[0].AsString +') order by CZYH';
    FrmeBRJBXX.EdtBQ.OnExit := nil;
  end;
  if FrmeBRJBXX.EdtZYH.CanFocus then
    FrmeBRJBXX.EdtZYH.SetFocus;
end;

procedure TFrmDBLR.FrmeBRJBXXEdtPopZYHChecked(Sender: TObject);
var FHXX :array [0..10] of string;
begin
  inherited;
  with FrmeBRJBXX do
  begin
    Clear;
    if EdtPopZYH.ValueByName('病区编码').AsString = '' then Exit;
    AZYBR.CZYH := EdtZYH.Text;
    AZYBR.IZYBQ := EdtPopZYH.ValueByName('病区编码').AsInteger;
    if not SetValue(AZYBR) then
    begin
      Clear;
      EdtZYH.Clear;
      Exit;
    end;
  end;
  if not ReflashDataSet then Exit;
  if EdtDBR.canFocus then EdtDBR.SetFocus;
  if Psystem.GetXtchcsExI('ZYDBRZWCZYZS', 0) = 1 then
  begin
    EdtDBR.Text := Pworker.sXM;
    if EdtDBJE.CanFocus then EdtDBJE.SetFocus;
  end;
  if Psystem.GetXtzhcsEx('CZYDBLRMRCZYANDJE','') <> '' then
  begin
    DataFJ(Psystem.GetXtzhcsEx('CZYDBLRMRCZYANDJE',''),fhxx,'|');
    EdtDBR.Text :=FHXX[1];
    IF FHXX[2] <> '' then
    begin
      EdtDBJE.Value :=StrToFloat(FHXX[2]);
    end;
  end;
end;

procedure TFrmDBLR.FrmeBRJBXXEdtPopZYHPressEnter(Sender: TObject;
  isChecked: Boolean; var CanExit: Boolean);
begin
  inherited;
  with FrmeBRJBXX do
  begin
    if Length(Trim(EdtZYH.Text)) > 8 then
    begin
      if ACard.CheckCardNo(Trim(EdtZYH.Text)) = 1 then
      begin
        EdtYLH.Text := ACard.CYKH;
        AZYBR.CYLH := ACard.CYKH;
        if trim(EdtBQ.Text) = '' then IBQ := 0;
        AZYBR.IZYBQ := IBQ;
        ITYPE := 1;
        if not SetValue(AZYBR) then
        begin
          Clear;
          EdtZYH.Clear;
          Exit;
        end;
        if not ReflashDataSet then Exit;
        if EdtDBR.canFocus then EdtDBR.SetFocus;
      end;
    end;
  end;

end;

procedure TFrmDBLR.FrmeBRJBXXEdtZYHChange(Sender: TObject);
begin
  inherited;
  if trim(FrmeBRJBXX.EdtXM.text) <> '' then ClearAll(1);


end;

function TFrmDBLR.GetCheckState(var BSPZT:Boolean): Boolean;
var CSQL:string;
begin
  Result:=False;
  BSPZT:=False;
  CSQL:='select CZYH from TBZYBRDBCXSP with(nolock) where CZYH='+QuotedStr(AZYBR.CZYH)+' and ISPBZ=1';
  if not PDbOpr.ExecSql(QryTemp,CSQL,False) then Exit;
  BSPZT:=not QryTemp.IsEmpty;
  Result:=True;
{create table TBZYBRDBCXSP
(
CZYH varchar(10),
DSJ datetime,
CSPR varchar(20),
ISPBZ int,
CCZYGH varchar(10),
 CONSTRAINT [PK_TBYKTFYMX] PRIMARY KEY CLUSTERED 
(
	CZYH ASC
)
) ON [PRIMARY]
}  
end;

function TFrmDBLR.GetDBRXX(CGH: string): Boolean;
var CSQL: string;
begin
  Result := False;
  CDBRMM := '';
  CSQL := ' Select CPWD,CUID From TBSYSCZY with(nolock) Where CUID=' + QuotedStr(CGH);
  if not PDbOpr.ExecAdoSql(QryTemp, CSQL, False) then Exit;
  with QryTemp do
  begin
    if IsEmpty then exit;
    CDBRMM := Decrypt2(FieldByName('CPWD').AsString, FieldByName('CUID').AsString, PassKey);
  end;
  Result := True;
end;

function TFrmDBLR.GetDBZE(var MDBJE:Currency;BQB:Boolean): Boolean;
var Tables:TStrings;
    ADate:TDateTime;
    I:Integer;
    CSQL,CZYH,CCZYGH:string;
begin
  Result:=False;
  MDBJE:=0;
  CZYH :='';
  CCZYGH := ' and CCZYGH=' +  QuotedStr(pWorker.sGH);                           //是否单独统计一个病人的担保金额（单独操作员统计）
  ADate:= AZYBR.DSCZTJZSJ;
  if ADate<AZYBR.DRYSJ then ADate:=AZYBR.DRYSJ;
  Tables:=pworker.NKCheckG('TBZYYXDBJL',ADate, now);
  if not BQB then
  begin
    CZYH := ' and CZYH=' + QuotedStr(AZYBR.CZYH);
    CCZYGH := 'and CCZYGH like '''+SysNo+'%''';
  end;
  for I := 0 to Tables.Count - 1 do
  begin
    CSQL:='select sum(MDBJE) MDBJE from '+Tables[I]+' where ISNULL(BZF,0)=0 ' + CCZYGH
      +#13#10+CZYH+' and DLRRQ>='+QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',ADate));
    if not PDbOpr.ExecSql(QryTemp,CSQL,False) then Exit;
    MDBJE:=MDBJE+QryTemp.Fields[0].AsCurrency;
  end;
  Result:=True;
end;

function TFrmDBLR.GetDBZEXZBYDBR(var MDBJE: Currency): Boolean;
var Tables:TStrings;
    ADate:TDateTime;
    I:Integer;
    Condit,CSQL:string;
begin
  Result:=False;
  //MDBJE:=0;
  ADate:=AZYBR.DRYSJ;
  Tables:=pworker.NKCheckG('TBZYYXDBJL',ADate, now);
  Condit := ' and CZYH=' + QuotedStr(AZYBR.CZYH);
  Condit :=Condit+ ' and CDBR='+QuotedStr(EdtDBR.Text);
  for I := 0 to Tables.Count - 1 do
  begin
    CSQL:='select sum(MDBJE) MDBJE from '+Tables[I]+' where ISNULL(BZF,0)=0 ' 
      +#13#10+Condit+' and DLRRQ>='+QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',ADate));
    if not PDbOpr.ExecSql(QryTemp,CSQL,False) then Exit;
    MDBJE:=MDBJE+QryTemp.Fields[0].AsCurrency;
  end;
  Result:=True;
end;

function TFrmDBLR.PrintDBXX: Boolean;
begin
  Result := False;
  ReportDll.BPreview := False;
  ReportDll.RPName := '住院病人担保信息';
  ReportDll.PrinterName := ''; ReportDll.PrintCopys := 1;
  if not ReportDll.PrePareRP then
  begin
    ShowMessageBox('准备报表失败!+1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  ReportDll.AddVariable('报表标题', '住院病人担保信息');
  ReportDll.addvariable('住院号', FrmeBRJBXX.EdtZYH.Text);
  ReportDll.addvariable('姓名', FrmeBRJBXX.EdtXM.Text);
  ReportDll.addvariable('性别', FrmeBRJBXX.EdtXB.Text);
  ReportDll.addvariable('年龄', FrmeBRJBXX.EdtNL.Text);
  ReportDll.addvariable('住院病区', FrmeBRJBXX.EdtZYBQ.Text);
  ReportDll.addvariable('收费种类', FrmeBRJBXX.EdtSFZL.Text);
  ReportDll.addvariable('保险号', FrmeBRJBXX.EdtBXH.Text);
  ReportDll.addvariable('入院时间', FrmeBRJBXX.EdtRYSJ.Text);
  ReportDll.addvariable('医疗号', FrmeBRJBXX.EdtYLH.Text);
  ReportDll.addvariable('科室', FrmeBRJBXX.EdtKS.Text);
  ReportDll.addvariable('住院医生', FrmeBRJBXX.EdtZYYS.Text);
  ReportDll.addvariable('床位', FrmeBRJBXX.EdtCW.Text);
  ReportDll.AddVariable('担保人', EdtDBR.Text);
  ReportDll.AddVariable('担保金额', EdtDBJE.Text);
  ReportDll.AddVariable('担保时间', DateToStr(EdtDBSJ.DateTime) + ' ' + TimeToStr(EdtDBSJ1.Time));
  ReportDll.AddVariable('担保有效期', DateToStr(EdtDBYXQ.DateTime) + ' ' + TimeToStr(EdtDBYXQ1.Time));

  if not ReportDll.PrintRP then
  begin
    ShowMessageBox('打印报表出错!+1+12+|', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  Result := True;
end;

function TFrmDBLR.ReflashDataSet: Boolean;
var
  TBNames: Tstrings;
  CSQL: widestring;
  I: integer;
begin
  Result := false;
  AZYBRDB.CZYH := AZYBR.CZYH;
  AZYBRDB.DRYSJ := AZYBR.DRYSJ;
  DSDB.DataSet := AZYBRDB.GetDBMX;
  if DSDB.DataSet = nil then
  begin
    Application.MessageBox(Pchar(ErrorInfo), '错误', MB_OK + MB_ICONERROR);
    Exit;
  end;
  Result := True;
end;

function TFrmDBLR.SaveData: boolean;
begin

end;

function TFrmDBLR.SaveZF: Boolean;
begin
  Result :=false;
  if not azybrdb.CancelDB then Exit;
  //写系统日志
  Psystem.CXM :='住院担保作废';
  Psystem.MSg1 := '住院号:'+ AZYBR.CZYH ;
  Psystem.MSg2 := '担保号:' + AZYBRDB.CDBBH;
  Psystem.IType := 23;
  if not Psystem.WriteLog then Exit;
  Result :=True;
end;

end.

