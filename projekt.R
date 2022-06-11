library(quantmod) #biblioteka za pomoc¹ której pobieramy dane
library(rvest) #biblioteka któr¹ wykorzystujemy do webscrapingu 

html1 <-read_html("https://en.wikipedia.org/wiki/List_of_S%26P_500_companies") 
ht<-html_table(html1)
tabela<-ht[[1]]

tabela$Symbol[65] <- "BRK-B"
tabela$Symbol[81] <- "BF-B" #dokonujemy korekt koniecznych ze wzglêdu na ró¿nice w zapisie symboli spó³ek 
symbole <- tabela$Symbol #pobieramy tabelê symboli spó³ek które nas interesuj¹
getSymbols(symbole,source = "yahoo",from = "2020-01-01",to="2022-01-31") #pobieramy dane
nazwy_wierszy<- rownames(A)



for (i in 1:(length(symbole))){
    assign(symbole[i],as.data.frame(get(symbole[i])))
    assign(symbole[i],get(symbole[i])[c(1:504),4]) 
}


  
przemys³ <- data.frame(MMM, AOS, ALK, ALLE, AAL, AME, BA, CHRW, CARR, CAT, CTAS, CPRT, CSX, CMI, DE, DAL, DOV, ETN, EMR,
                       EFX, EXPD, FAST, FDX, FTV, FBHS, GE, GNRC, GD, GWW, HON, HWM, HII, IEX, ITW, IR, JBHT, J, JCI,
                       LHX, LDOS, LMT, MAS, NLSN, NDSN, NSC, NOC, ODFL, OTIS, PCAR, PH, PNR, PWR, RTX, RSG, RHI, ROK, ROL,
                       ROP, SNA, LUV, SWK, TDY, TXT, TT, TDG, UNP, UAL, UPS, URI, VRSK, WAB, WM, XYL)
rownames(przemys³)<- nazwy_wierszy

`opieka zdrowotna` <- data.frame(ABT, ABBV, ABMD, A, ALGN, ABC, AMGN, ANTM, BAX, BDX, BIO, TECH, BIIB, BSX, BMY, CAH, CTLT,
                                 CNC, CRL, CI, COO, CVS, DHR, DVA, XRAY, DXCM, EW, GILD, HCA, HSIC, HOLX, HUM, IDXX, ILMN,
                                 INCY, ISRG, IQV, JNJ, LH, LLY, MCK, MDT, MRK, MTD, MRNA, MOH, OGN, PKI, PFE, DGX, REGN, RMD,
                                 STE, SYK, TFX, TMO, UNH, UHS, VRTX, VTRS, WAT, WST, ZBH, ZTS)
rownames(`opieka zdrowotna`)<- nazwy_wierszy

`bran¿a IT` <- data.frame(ACN, ADBE, ADP, AKAM, AMD, APH, ADI, ANSS, AAPL, AMAT, ANET, ADSK, AVGO, BR, CDNS, CDW, CDAY, CSCO, CTXS, CTSH,
                 GLW, DXC, ENPH, EPAM, FFIV, FIS, FISV, FLT, FTNT, IT, GPN, HPE, HPQ, INTC, IBM, INTU, IPGP, JKHY, JNPR, KEYS,
                 KLAC, LRCX, MA, MCHP, MU, MSFT, MPWR, MSI, NTAP, NLOK, NVDA, NXPI, ORCL, PAYX, PAYC, PYPL, PTC, QRVO, QCOM, CRM,
                 STX, NOW, SWKS, SEDG, SNPS, TEL, TER, TXN, TRMB, TYL, VRSN, V, WDC, ZBRA)
rownames(`bran¿a IT`)<- nazwy_wierszy

`us³ugi komunikacyjne` <- data.frame(ATVI, GOOGL, GOOG, T, CHTR, CMCSA, DISH, DIS, EA, FOXA, FOX, IPG, LYV, LUMN, MTCH, META, NFLX,
                                     NWSA, NWS, OMC, PARA, TMUS, TTWO, TWTR, VZ, WBD)
rownames(`us³ugi komunikacyjne`)<- nazwy_wierszy

`podstawowe produkty konsumenckie` <- data.frame(ADM, MO, `BF-B`, CPB, CHD, CLX, KO, CL, CAG, STZ, COST, EL, GIS, HSY, HRL, K, KMB,
                                                 KHC, KR, LW, MKC, TAP, MDLZ, MNST, PEP, PM, PG, SJM, SYY, TSN, WBA, WMT)
rownames(`podstawowe produkty konsumenckie`)<- nazwy_wierszy

`towary luksusowe` <- data.frame(AAP, AMZN, APTV, AZO, BBWI, BBY, BKNG, BWA, CZR, KMX, CCL, CMG, DHI, DRI, DG, DLTR, DPZ, EBAY, ETSY,
                                 EXPE, F, GRMN, GPC, GM, HAS, HLT, HD, LVS, LEN, LKQ, LOW, MAR, MCD, MGM, MHK, NWL, NKE, NCLH, NVR,
                                 ORLY, PENN, POOL, PHM, PVH, RL, ROST, RCL, SBUX, TPR, TGT, TSLA, TJX, TSCO, ULTA, UAA, UA, VFC, WHR,
                                 WYNN, YUM)
rownames(`towary luksusowe`)<- nazwy_wierszy

media <- data.frame(AES, LNT, AEE, AEP, AWK, ATO, CNP, CMS, ED, CEG, D, DTE, DUK, EIX, ETR, EVRG, ES, EXC, FE, NEE, NI, NRG, PNW, PPL,
                    PEG, SRE, SO, WEC, XEL)
rownames(media)<- nazwy_wierszy

finanse <- data.frame(AFL, AIG, ALL, AXP, AMP, AON, AIZ, BAC, WRB, `BRK-B`, BLK, BK, BRO, COF, CBOE, SCHW, CB, CINF, C, CFG, CME, CMA,
                      DFS, RE, FDS, FITB, FRC, BEN, AJG, GL, GS, HIG, HBAN, ICE, IVZ, JPM, KEY, LNC, L, MTB, MKTX, MMC, MET, MCO, MS,
                      MSCI, NDAQ, NTRS, PNC, PFG, PGR, PRU, RJF, RF, SPGI, SBNY, STT, SIVB, SYF, TROW, TRV, TFC, USB, WFC, WTW, ZION)
rownames(finanse)<- nazwy_wierszy

materia³y <- data.frame(APD, ALB, AMCR, AVY, BALL, CE, CF, CTVA, DOW, DD, EMN, ECL, FMC, FCX, IP, IFF, LIN, LYB, MLM, MOS, NEM, NUE,
                        PKG, PPG, SEE, SHW, VMC, WRK)
rownames(materia³y)<- nazwy_wierszy

nieruchomoœci <- data.frame(ARE, AMT, AVB, BXP, CPT, CBRE, CCI, DLR, DRE, EQIX, EQR, ESS, EXR, FRT, PEAK, HST, IRM, KIM, MAA, PLD,
                            PSA, O, REG, SBAC, SPG, UDR, VTR, VICI, VNO, WELL, WY)
rownames(nieruchomoœci)<- nazwy_wierszy

energia <- data.frame(APA, BKR, CVX, COP, CTRA, DVN, FANG, EOG, XOM, HAL, HES, KMI, MRO, MPC, OXY, OKE, PSX, PXD, SLB, VLO, WMB)
rownames(energia)<- nazwy_wierszy



