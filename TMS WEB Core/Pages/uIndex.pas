unit uIndex;

interface

uses
  System.SysUtils,
  System.Classes,

  JS,
  Web,
  WEBLib.Graphics,
  WEBLib.Controls,
  WEBLib.Forms,
  WEBLib.Dialogs,
  Vcl.StdCtrls,
  WEBLib.StdCtrls,
  Vcl.Controls,
  WEBLib.ExtCtrls,
  WEBLib.WebCtrls,
  Vcl.Forms,

  tHeader,
  tContact,
  tFooter,
  tPopUp,

  uConfig;

type
  TfrmHome = class(TWebForm)
    layContent: TWebScrollBox;
    layContentContainerIntro: TWebPanel;
    layContentContainerPortfolio: TWebPanel;
    layContentIntro: TWebGridPanel;
    layContentIntroLeft: TWebPanel;
    lblContentTitleIntro: TWebLabel;
    layContentIntroRight: TWebPanel;
    layPortfolio: TWebGridPanel;
    layContentHeading: TWebPanel;
    imgLogo: TWebImageControl;
    lblSiteName: TWebLabel;
    lblJobTitles: TWebLabel;
    CustomHr1Container: TWebPanel;
    CustomHr1: TWebPanel;
    WebPanel9: TWebPanel;
    WebPanel10: TWebPanel;
    FooterLinkFacebook: TWebHTMLContainer;
    lblPortfolio: TWebLabel;
    CustomHr2Container: TWebPanel;
    CustomHr2: TWebPanel;
    WebPanel3: TWebPanel;
    WebPanel4: TWebPanel;
    WebHTMLContainer1: TWebHTMLContainer;
    WebLabel2: TWebLabel;
    CustomHr3Container: TWebPanel;
    CustomHr3: TWebPanel;
    WebPanel7: TWebPanel;
    WebPanel8: TWebPanel;
    WebHTMLContainer2: TWebHTMLContainer;
    WebLabel3: TWebLabel;
    btnFreeDownload: TWebButton;
    Frame_Footer1: TFrame_Footer;
    layPortfolio1: TWebPanel;
    imgPortfolio1: TWebImageControl;
    layPortfolio2: TWebPanel;
    imgPortfolio2: TWebImageControl;
    layPortfolio3: TWebPanel;
    imgPortfolio3: TWebImageControl;
    layPortfolio4: TWebPanel;
    imgPortfolio4: TWebImageControl;
    layPortfolio5: TWebPanel;
    imgPortfolio5: TWebImageControl;
    layPortfolio6: TWebPanel;
    imgPortfolio6: TWebImageControl;
    layContentContact: TWebPanel;
    CustomHr4Container: TWebPanel;
    CustomHr4: TWebPanel;
    WebPanel1: TWebPanel;
    WebPanel2: TWebPanel;
    WebHTMLContainer3: TWebHTMLContainer;
    WebLabel4: TWebLabel;
    Frame_Contact: TFrame_Contact;
    layContainer: TWebPanel;
    Frame_Header: TFrame_Header;
    procedure WebFormCreate(Sender: TObject);
    procedure WebFormResize(Sender: TObject);
    procedure FilterButtonsMouseEnter(Sender: TObject);
    procedure FilterButtonsMouseLeave(Sender: TObject);
    procedure FilterButtonsClick(Sender: TObject);
    procedure ThemeImageMouseEnter(Sender: TObject);
    procedure ThemeImageMouseLeave(Sender: TObject);
    procedure ButtonMouseEnter(Sender: TObject);
    procedure ButtonMouseLeave(Sender: TObject);
    procedure imgLogoLoaded(Sender: TObject);
    procedure PortfolioClick(Sender: TObject);
    procedure btnFreeDownloadMouseEnter(Sender: TObject);
    procedure btnFreeDownloadMouseLeave(Sender: TObject);
  private
    { Private declarations }
    procedure RenderLabelCaptionsHTML();
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.dfm}

procedure TfrmHome.btnFreeDownloadMouseEnter(Sender: TObject);
begin
  TWebButton(Sender).Color := clWhite;
  TWebButton(Sender).Font.Color := clBlack;
end;

procedure TfrmHome.btnFreeDownloadMouseLeave(Sender: TObject);
begin
  TWebButton(Sender).Color := $009CBC1A;
  TWebButton(Sender).Font.Color := clWhite;
end;

procedure TfrmHome.ButtonMouseEnter(Sender: TObject);
begin
  TWebButton(Sender).Color := $00302ADA;
end;

procedure TfrmHome.ButtonMouseLeave(Sender: TObject);
begin
  TWebButton(Sender).Color := $00241FB2;
end;

procedure TfrmHome.FilterButtonsClick(Sender: TObject);
var
  cb: TJSHTMLElement;
begin
  if (Sender is TWebPanel) then
  begin
    cb := TJSHTMLElement(TWebPanel(Sender).ElementHandle.getElementsByTagName('input').Items[0]);
    asm
      cb.checked = !cb.checked;
    end;
  end;
end;

procedure TfrmHome.FilterButtonsMouseEnter(Sender: TObject);
begin
  TWebPanel(Sender).Color := $00F2F2F2;
end;

procedure TfrmHome.FilterButtonsMouseLeave(Sender: TObject);
begin
  TWebPanel(Sender).Color := clWhite;
end;

procedure TfrmHome.imgLogoLoaded(Sender: TObject);
begin
  WebFormResize(nil);
end;

procedure TfrmHome.PortfolioClick(Sender: TObject);
var
  MyPopUp: TTemplate_PopUp;
begin
  MyPopUp := TTemplate_PopUp.Create(Self);
  MyPopUp.ElementID := 'Template_PopUp';
  MyPopUp.Parent := frmHome;
  MyPopUp.Align := alClient;
  MyPopUp.LoadFromForm;

  MyPopUp.SetContent(
    TWebImageControl(Sender).Hint,
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.',
    TWebImageControl(Sender).URL
  );

  MyPopUp.StyleControls;

end;

procedure TfrmHome.RenderLabelCaptionsHTML;
begin
  TJSHTMLElement(lblContentTitleIntro.ElementHandle.firstChild).innerHTML := lblContentTitleIntro.Caption;
//  TJSHTMLElement(lblContentDescriptionIntro.ElementHandle.firstChild).innerHTML := lblContentDescriptionIntro.Caption;
end;

procedure TfrmHome.ThemeImageMouseEnter(Sender: TObject);
begin
//  TWebImageControl(Sender).ElementHandle.style.setProperty('transform','translateY(-0.333333rem)');
end;

procedure TfrmHome.ThemeImageMouseLeave(Sender: TObject);
begin
//  TWebImageControl(Sender).ElementHandle.style.removeProperty('transform');
end;

procedure TfrmHome.WebFormCreate(Sender: TObject);
begin
  document.title := AppDescription + ' - ' + AppName;

  // Header & Footer
  Frame_Header.StyleControls;
  Frame_Contact.StyleControls;
  Frame_Footer.StyleControls;

  // Portfolio
  imgPortfolio1.ElementHandle.style.setProperty('border','1px solid #b21f24');
  imgPortfolio1.ElementHandle.style.setProperty('border-radius','10px');
  imgPortfolio2.ElementHandle.style.setProperty('border','1px solid #b21f24');
  imgPortfolio2.ElementHandle.style.setProperty('border-radius','10px');
  imgPortfolio3.ElementHandle.style.setProperty('border','1px solid #b21f24');
  imgPortfolio3.ElementHandle.style.setProperty('border-radius','10px');
  imgPortfolio4.ElementHandle.style.setProperty('border','1px solid #b21f24');
  imgPortfolio4.ElementHandle.style.setProperty('border-radius','10px');
  imgPortfolio5.ElementHandle.style.setProperty('border','1px solid #b21f24');
  imgPortfolio5.ElementHandle.style.setProperty('border-radius','10px');
  imgPortfolio6.ElementHandle.style.setProperty('border','1px solid #b21f24');
  imgPortfolio6.ElementHandle.style.setProperty('border-radius','10px');

  // About
  btnFreeDownload.ElementHandle.style.setProperty('border-radius','10px');
  btnFreeDownload.ElementHandle.style.setProperty('border','1px solid white');


  RenderLabelCaptionsHTML;
end;

procedure TfrmHome.WebFormResize(Sender: TObject);
begin
  imgLogo.Margins.Left := (imgLogo.Parent.Width - 300) div 2;
  imgLogo.Margins.Right := (imgLogo.Parent.Width - 300) div 2;

  if (frmHome.Width >= ContainerWidth) then
  begin
    layContentIntro.Margins.Left := (layContentIntro.Parent.Width - ContainerWidth) div 2;
    layContentIntro.Margins.Right := (layContentIntro.Parent.Width - ContainerWidth) div 2;

    layPortfolio.Margins.Left := (layPortfolio.Parent.Width - ContainerWidth) div 2;
    layPortfolio.Margins.Right := (layPortfolio.Parent.Width - ContainerWidth) div 2;
  end else
  begin
    layContentIntro.Margins.Left := 40;
    layContentIntro.Margins.Right := 40;

    layPortfolio.Margins.Left := 40;
    layPortfolio.Margins.Right := 40;
  end;

  layContentHeading.Height := imgLogo.Height + imgLogo.Margins.Top + imgLogo.Margins.Bottom +
                              lblSiteName.Height + lblSiteName.Margins.Top + lblSiteName.Margins.Bottom +
                              CustomHr1Container.Height + CustomHr1Container.Margins.Top + CustomHr1Container.Margins.Bottom +
                              lblJobTitles.Height + lblJobTitles.Margins.Top + lblJobTitles.Margins.Bottom;


//  layContentContainerIntro.Height := lblContentTitleIntro.Height + lblContentTitleIntro.Margins.Top + lblContentTitleIntro.Margins.Bottom +
//                                     lblContentDescriptionIntro.Height + lblContentDescriptionIntro.Margins.Top + lblContentDescriptionIntro.Margins.Bottom +
//                                     layBrowseTemplatesAndThemes.Height + layBrowseTemplatesAndThemes.Margins.Top + layBrowseTemplatesAndThemes.Margins.Bottom;

  layPortfolio.Height := (imgPortfolio1.Height + imgPortfolio1.Margins.Top + imgPortfolio1.Margins.Bottom) * 2;

  layContentContainerPortfolio.Height := lblPortfolio.Height + lblPortfolio.Margins.Top + lblPortfolio.Margins.Bottom +
                                         CustomHr2Container.Height + CustomHr2Container.Margins.Top + CustomHr2Container.Margins.Bottom +
                                         layPortfolio.Height + layPortfolio.Margins.Top + layPortfolio.Margins.Bottom;


  CustomHr1.Left := (CustomHr1.Parent.Width - CustomHr1.Width) div 2;
  CustomHr2.Left := (CustomHr2.Parent.Width - CustomHr2.Width) div 2;
  CustomHr3.Left := (CustomHr3.Parent.Width - CustomHr3.Width) div 2;
  CustomHr4.Left := (CustomHr4.Parent.Width - CustomHr4.Width) div 2;


  btnFreeDownload.Margins.Left := (imgLogo.Parent.Width - 200) div 2;
  btnFreeDownload.Margins.Right := (imgLogo.Parent.Width - 200) div 2;



  asm
    window.dispatchEvent(new Event('resize'));
  end;
end;

end.