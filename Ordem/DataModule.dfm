�
 TDM 0*	  TPF0TDMDMOnCreateDMCreate	OnDestroy	DMDestroyLeft� TopDHeight� WidthG TDataSource
DSClientesDataSet
TBClientesLeftTop  TTable
TBClientesActive	DatabaseNamec:\Projetos\Ordem	TableNameclientes.dbfLeftTopH TFloatFieldTBClientesCODIGO	FieldNameCODIGO  TStringFieldTBClientesNOME	FieldNameNOMESize�   TStringFieldTBClientesENDERECO	FieldNameENDERECOSize�   TStringFieldTBClientesBAIRRO	FieldNameBAIRROSized  TStringFieldTBClientesCIDADE	FieldNameCIDADESize2  TStringFieldTBClientesCEP	FieldNameCEPSize	  TStringFieldTBClientesTELEFONE	FieldNameTELEFONESize	  TStringFieldTBClientesCELULAR	FieldNameCELULARSize	   TTable	TBServicoDatabaseNamec:\Projetos\Ordem	TableNameServico.dbfLeftxTopH TFloatFieldTBServicoCODCLI	FieldNameCODCLI  TFloatFieldTBServicoCODORD	FieldNameCODORD  
TDateFieldTBServicoDATA	FieldNameDATA  
TMemoFieldTBServicoDEFEITO	FieldNameDEFEITOBlobTypeftMemoSize  
TMemoFieldTBServicoSOLUCAO	FieldNameSOLUCAOBlobTypeftMemoSize  TFloatFieldTBServicoPRECO	FieldNamePRECO  TSmallintFieldTBServicoSTATUS	FieldNameSTATUS   TDataSource	DSServicoDataSet	TBServicoLeftxTop  TQueryQrOSAutoCalcFieldsSQL.Strings_SELECT DISTINCT C.Codigo, C.Nome, C.Endereco, C.Bairro, C.Cidade, C.CEP, C.Telefone, C.Celular FROM "Clientes.dbf"CWHERE C.Codigo=:Cod Params.Data
     Cod        Left� TopH TFloatField
QrOSCODIGO	FieldNameCODIGO  TStringFieldQrOSNOME	FieldNameNOMESize�   TStringFieldQrOSENDERECO	FieldNameENDERECOSize�   TStringField
QrOSBAIRRO	FieldNameBAIRROSized  TStringField
QrOSCIDADE	FieldNameCIDADESize2  TStringFieldQrOSCEP	FieldNameCEPSize	  TStringFieldQrOSTELEFONE	FieldNameTELEFONESize	  TStringFieldQrOSCELULAR	FieldNameCELULARSize	   TDataSourceDSOSAutoEditDataSetQrOSLeft� Top  TDataSourceDSSAutoEditDataSetQrSLeft� Top  TQueryQrSAutoCalcFieldsSQL.Strings5SELECT DISTINCT S.CodCli, S.Codord, S.Data, S.defeitoFROM "Servico.dbf"SWHERE S.Codord=:codord Params.Data
     codord        Left� TopH TFloatField	QrSCODCLI	FieldNameCODCLI  TFloatField	QrSCODORD	FieldNameCODORD  
TDateFieldQrSDATA	FieldNameDATA  
TMemoField
QrSDEFEITO	FieldNameDEFEITOBlobTypeftMemoSize    