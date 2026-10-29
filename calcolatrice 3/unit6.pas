unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    // Dichiarazione delle 3 Edit
    EditNum1: TEdit;
    EditNum2: TEdit;
    EditTotale: TEdit;

    // Dichiarazione dei 4 Button
    BtnPiu: TButton;
    BtnMeno: TButton;
    BtnPer: TButton;
    BtnDiviso: TButton;

    // Dichiarazione delle etichette (Label) di supporto
    LblNum1, LblNum2, LblTotale: TLabel;

    // Metodo unico per gestire i clic sui pulsanti
    procedure GestisciOperazione(Sender: TObject);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Impostazioni della finestra principale
  Self.Caption := 'Calcolatrice';
  Self.Width := 300;
  Self.Height := 280;
  Self.Position := poScreenCenter;

  // --- Creazione delle Label e delle Edit ---

  // Etichetta e Prima Edit
  LblNum1 := TLabel.Create(Self);
  LblNum1.Parent := Self;
  LblNum1.Caption := 'Primo Numero:';
  LblNum1.Left := 20;
  LblNum1.Top := 20;

  EditNum1 := TEdit.Create(Self);
  EditNum1.Parent := Self;
  EditNum1.Left := 130;
  EditNum1.Top := 15;
  EditNum1.Width := 140;

  // Etichetta e Seconda Edit
  LblNum2 := TLabel.Create(Self);
  LblNum2.Parent := Self;
  LblNum2.Caption := 'Secondo Numero:';
  LblNum2.Left := 20;
  LblNum2.Top := 60;

  EditNum2 := TEdit.Create(Self);
  EditNum2.Parent := Self;
  EditNum2.Left := 130;
  EditNum2.Top := 55;
  EditNum2.Width := 140;

  // Etichetta e Terza Edit (Totale)
  LblTotale := TLabel.Create(Self);
  LblTotale.Parent := Self;
  LblTotale.Caption := 'Totale:';
  LblTotale.Left := 20;
  LblTotale.Top := 100;

  EditTotale := TEdit.Create(Self);
  EditTotale.Parent := Self;
  EditTotale.Left := 130;
  EditTotale.Top := 95;
  EditTotale.Width := 140;
  EditTotale.ReadOnly := True; // Impedisce la modifica manuale del totale
  EditTotale.Color := clBtnFace; // Aspetto visivo disabilitato

  // --- Creazione dei 4 Pulsanti ---

  // Pulsante +
  BtnPiu := TButton.Create(Self);
  BtnPiu.Parent := Self;
  BtnPiu.Caption := '+';
  BtnPiu.Left := 20;
  BtnPiu.Top := 150;
  BtnPiu.Width := 55;
  BtnPiu.Height := 40;
  BtnPiu.OnClick := @GestisciOperazione;

  // Pulsante -
  BtnMeno := TButton.Create(Self);
  BtnMeno.Parent := Self;
  BtnMeno.Caption := '-';
  BtnMeno.Left := 85;
  BtnMeno.Top := 150;
  BtnMeno.Width := 55;
  BtnMeno.Height := 40;
  BtnMeno.OnClick := @GestisciOperazione;

  // Pulsante x
  BtnPer := TButton.Create(Self);
  BtnPer.Parent := Self;
  BtnPer.Caption := 'x';
  BtnPer.Left := 150;
  BtnPer.Top := 150;
  BtnPer.Width := 55;
  BtnPer.Height := 40;
  BtnPer.OnClick := @GestisciOperazione;

  // Pulsante :
  BtnDiviso := TButton.Create(Self);
  BtnDiviso.Parent := Self;
  BtnDiviso.Caption := ':';
  BtnDiviso.Left := 215;
  BtnDiviso.Top := 150;
  BtnDiviso.Width := 55;
  BtnDiviso.Height := 40;
  BtnDiviso.OnClick := @GestisciOperazione;
end;

procedure TForm1.GestisciOperazione(Sender: TObject);
var
  Num1, Num2, Risultato: Double;
  Simbolo: string;
begin
  // Controllo validità dell'input nel primo numero
  if not TryStrToFloat(EditNum1.Text, Num1) then
  begin
    ShowMessage('Inserisci un numero valido nella prima casella!');
    Exit;
  end;

  // Controllo validità dell'input nel secondo numero
  if not TryStrToFloat(EditNum2.Text, Num2) then
  begin
    ShowMessage('Inserisci un numero valido nella seconda casella!');
    Exit;
  end;

  // Identificazione dell'operazione tramite il pulsante premuto
  Simbolo := TButton(Sender).Caption;

  if Simbolo = '+' then
    Risultato := Num1 + Num2
  else if Simbolo = '-' then
    Risultato := Num1 - Num2
  else if Simbolo = 'x' then
    Risultato := Num1 * Num2
  else if Simbolo = ':' then
  begin
    if Num2 = 0 then
    begin
      ShowMessage('Errore: Impossibile dividere per zero!');
      Exit;
    end;
    Risultato := Num1 / Num2;
  end;

  // Visualizzazione del risultato finale
  EditTotale.Text := FloatToStr(Risultato);
end;

end.
