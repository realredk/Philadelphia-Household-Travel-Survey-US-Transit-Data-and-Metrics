install.packages("ggplot2")
install.packages("dplyr")

library(ggplot2)
library(dplyr)

# 1 a
data1 <- subset(NTD.ts, Year == 2019 & UPT != 0 & PMT != 0 & Mode %in% c("LR", "HR", "CR", "MB"))
data1$Ratio_PMT_UPT <- data1$PMT / data1$UPT
avg_PMT_UPT <- mean(data1$Ratio_PMT_UPT, na.rm = TRUE)
print(avg_PMT_UPT) 

# 1 b
data2 <- subset(
  NTD.ts,
  Year == 2019 & 
    DRM != 0 & !is.na(DRM) & 
    PMT != 0 & !is.na(PMT) & 
    Mode %in% c("LR", "HR", "CR", "MB")
)
data2$Ratio_PMT_DRM <- data2$PMT / data2$DRM
avg_PMT_DRM <- mean(data2$Ratio_PMT_DRM, na.rm = TRUE)
print(avg_PMT_DRM) 

# 1 c
data3 <- subset(
  NTD.ts,
  Year == 2019 & 
    FARES != 0 & !is.na(FARES) & 
    PMT != 0 & !is.na(PMT) & 
    Mode %in% c("LR", "HR", "CR", "MB")
)
data3$Ratio_FARES_PMT <- data3$FARES / data3$PMT
avg_FARES_PMT <- mean(data3$Ratio_FARES_PMT, na.rm = TRUE)
print(avg_FARES_PMT) 

# 1 d
data4 <- subset(
  NTD.ts,
  Year == 2019 & 
    FARES != 0 & !is.na(FARES) & 
    OPEXP_TOTAL != 0 & !is.na(OPEXP_TOTAL) & 
    Mode %in% c("LR", "HR", "CR", "MB")
)
data4$Ratio_FARES_OPEXP <- data4$FARES / data4$OPEXP_TOTAL
avg_FARES_OPEXP <- mean(data4$Ratio_FARES_OPEXP, na.rm = TRUE)
print(avg_FARES_OPEXP) 

# 1 e
data5 <- subset(
  NTD.ts,
  Year == 2019 & 
    VRM != 0 & !is.na(VRM) & 
    VRH != 0 & !is.na(VRH) & 
    Mode %in% c("LR", "HR", "CR", "MB")
)
data5$Ratio_VRM_VRH <- data5$VRM / data5$VRH
avg_VRM_VRH <- mean(data5$Ratio_VRM_VRH, na.rm = TRUE)
print(avg_VRM_VRH) 

# 2
data6_LR <- subset(NTD.ts, Year == 2019 & Mode == "LR" & FARES != 0 & !is.na(FARES) & OPEXP_TOTAL != 0 & !is.na(OPEXP_TOTAL))
data6_HR <- subset(NTD.ts, Year == 2019 & Mode == "HR" & FARES != 0 & !is.na(FARES) & OPEXP_TOTAL != 0 & !is.na(OPEXP_TOTAL))
data6_CR <- subset(NTD.ts, Year == 2019 & Mode == "CR" & FARES != 0 & !is.na(FARES) & OPEXP_TOTAL != 0 & !is.na(OPEXP_TOTAL))
data6_MB <- subset(NTD.ts, Year == 2019 & Mode == "MB" & FARES != 0 & !is.na(FARES) & OPEXP_TOTAL != 0 & !is.na(OPEXP_TOTAL))
FRR_LR <- sum(data6_LR$FARES) / sum(data6_LR$OPEXP_TOTAL)
FRR_HR <- sum(data6_HR$FARES) / sum(data6_HR$OPEXP_TOTAL)
FRR_CR <- sum(data6_CR$FARES) / sum(data6_CR$OPEXP_TOTAL)
FRR_MB <- sum(data6_MB$FARES) / sum(data6_MB$OPEXP_TOTAL)
print(FRR_LR) 
print(FRR_HR)
print(FRR_CR)
print(FRR_MB) 

# 3
LA <- subset(
  NTD.ts,
  Year %in% 2002:2021 & 
    FARES != 0 & !is.na(FARES) & 
    OPEXP_TOTAL != 0 & !is.na(OPEXP_TOTAL) & 
    (NTD.ID == 90154 | NTD.ID == 90151) & 
    Mode %in% c("LR", "HR", "CR", "MB")
)
LA$Mode[LA$Mode == "MB" & LA$Service == "PT"] <- "MB_PT"
LA$Mode[LA$Mode == "MB" & LA$Service == "DO"] <- "MB_DO"
LA_result <- aggregate(cbind(FARES, OPEXP_TOTAL) ~ Year + Mode, data = LA, FUN = sum)
legend_order <- c("LR", "HR", "CR", "MB_DO", "MB_PT")
ggplot(LA_result, aes(x = Year, y = FARES/OPEXP_TOTAL, group = Mode, color = Mode)) +
  geom_line(size = 1) +
  labs(title = "Examples of LA Public Transportation Fare Recovery Ratio from 2002 to 2021",
       x = "Year",
       y = "Fare Recovery Ratio") +
  scale_x_continuous(breaks = seq(2002, 2021, 1), minor_breaks = NULL) +
  scale_x_continuous(breaks = seq(2002, 2021, 1), minor_breaks = NULL) +
  scale_color_manual(values = c("darkblue", "darkred", "darkgreen", "darkorange", "purple"),
                     breaks = legend_order) +
  theme_minimal() +
  guides(color = guide_legend(override.aes = list(size = 1)))

head(LA_result)