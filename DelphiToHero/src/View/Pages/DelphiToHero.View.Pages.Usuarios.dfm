inherited PageUsuarios: TPageUsuarios
  Caption = 'PageUsuarios'
  ExplicitLeft = -230
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPrincipal: TPanel
    inherited pnlBody: TPanel
      inherited pnlMainBody: TPanel
        inherited Panel5: TPanel
          inherited DBGrid1: TDBGrid [0]
          end
          inherited Panel6: TPanel [1]
            inherited Panel2: TPanel
              inherited SpeedButton6: TSpeedButton
                Align = alNone
              end
            end
            object StackPanel1: TStackPanel
              Left = 0
              Top = 0
              Width = 265
              Height = 254
              Align = alLeft
              BevelOuter = bvNone
              ControlCollection = <
                item
                  Control = lblCodigo
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = edtCodigo
                end
                item
                  Control = lblNome
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = edtNome
                end
                item
                  Control = lblFone
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = edtFone
                end
                item
                  Control = lblProficao
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = edtProfissao
                end
                item
                  Control = lblbalance
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = edtSaldo
                end>
              HorizontalPositioning = sphpFill
              Padding.Left = 15
              Padding.Right = 15
              TabOrder = 1
              object lblCodigo: TLabel
                Left = 15
                Top = 0
                Width = 235
                Height = 13
                Align = alTop
                Caption = 'Guuid'
              end
              object edtCodigo: TEdit
                Left = 15
                Top = 15
                Width = 235
                Height = 21
                TabOrder = 0
              end
              object lblNome: TLabel
                Left = 15
                Top = 38
                Width = 235
                Height = 13
                Align = alTop
                Caption = 'Nome'
              end
              object edtNome: TEdit
                Left = 15
                Top = 53
                Width = 235
                Height = 21
                TabOrder = 1
              end
              object lblFone: TLabel
                Left = 15
                Top = 76
                Width = 235
                Height = 13
                Align = alTop
                Caption = 'Telefone'
              end
              object edtFone: TEdit
                Left = 15
                Top = 91
                Width = 235
                Height = 21
                TabOrder = 2
              end
              object lblProficao: TLabel
                Left = 15
                Top = 114
                Width = 235
                Height = 13
                Align = alTop
                Caption = 'Profiss'#227'o'
              end
              object edtProfissao: TEdit
                Left = 15
                Top = 129
                Width = 235
                Height = 21
                TabOrder = 3
              end
              object lblbalance: TLabel
                Left = 15
                Top = 152
                Width = 235
                Height = 13
                Align = alTop
                Caption = 'Saldo'
              end
              object edtSaldo: TEdit
                Left = 15
                Top = 167
                Width = 235
                Height = 21
                TabOrder = 4
              end
            end
            object StackPanel2: TStackPanel
              Left = 265
              Top = 0
              Width = 288
              Height = 254
              Align = alLeft
              BevelOuter = bvNone
              ControlCollection = <
                item
                  Control = lblbirthdate
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = edtbirthdate
                end
                item
                  Control = Label1
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = edtlasttransaction
                end
                item
                  Control = Label3
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = edtCPF
                end
                item
                  Control = lblTra
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = edtCNPJ
                end>
              HorizontalPositioning = sphpFill
              Padding.Left = 15
              Padding.Right = 15
              TabOrder = 2
              object lblbirthdate: TLabel
                Left = 15
                Top = 0
                Width = 258
                Height = 13
                Align = alTop
                Caption = 'Data Anivers'#225'rio'
              end
              object edtbirthdate: TDateTimePicker
                Left = 15
                Top = 15
                Width = 258
                Height = 21
                Date = 44279.000000000000000000
                Time = 0.949728275460074700
                TabOrder = 0
              end
              object Label1: TLabel
                Left = 15
                Top = 38
                Width = 258
                Height = 13
                Align = alTop
                Caption = 'Ultima Transa'#231#227'o'
              end
              object edtlasttransaction: TDateTimePicker
                Left = 15
                Top = 53
                Width = 258
                Height = 21
                Date = 44279.000000000000000000
                Time = 0.949728275460074700
                Kind = dtkTime
                TabOrder = 1
              end
              object Label3: TLabel
                Left = 15
                Top = 76
                Width = 258
                Height = 13
                Align = alTop
                Caption = 'CPF'
              end
              object edtCPF: TEdit
                Left = 15
                Top = 91
                Width = 258
                Height = 21
                TabOrder = 2
              end
              object lblTra: TLabel
                Left = 15
                Top = 114
                Width = 258
                Height = 13
                Align = alTop
                Caption = 'CNPJ'
              end
              object edtCNPJ: TEdit
                Left = 15
                Top = 129
                Width = 258
                Height = 21
                TabOrder = 3
              end
            end
          end
        end
      end
    end
  end
end
