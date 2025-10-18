# Population Dynamics Analysis

This repository contains the data, analysis scripts, and results related to the **Population Dynamics** of vultures across South and Southeast Asia, with comparative data from the Qinghai–Tibet Plateau.

---

## Project Structure

```
Population_Dynamics_Analysis/
│
├── Data/
│   └── Population_Dynamics_Data.csv
│
├── Scripts/
│   └── Population_Dynamics_Analysis.R
│
├── Results/
│   ├── Population_Dynamics_Plot.png
│   ├── Region_Period_Boxplot.png
│   ├── SA_SEA_Counts_Over_Time.png
│   └── ANOVA_Table.csv
│
└── README.md
```

---

## 1. Data

**File:** `Population_Dynamics_Data.csv`  
**Description:**  
Contains population records from multiple countries across different regions and years, distinguishing between *breeding* and *non-breeding* areas.

| Column | Description |
|---------|-------------|
| `Country` | Country of observation (e.g., Tibet, Nepal, Thailand) |
| `Area` | Area type: *Breeding* or *Non-breeding* |
| `Region` | Geographic region: *Qinghai–Tibet Plateau*, *South Asia*, or *Southeast Asia* |
| `Year` | Observation year |
| `No` | Number of individuals observed (count or estimate) |

**Regions represented:**
- **Qinghai–Tibet Plateau:** Tibet  
- **South Asia:** Nepal, Pakistan  
- **Southeast Asia:** Myanmar, Thailand, Cambodia, Malaysia, Singapore, Indonesia  

---

## 2. Scripts

**File:** `Population_Dynamics_Analysis.R`  
**Purpose:** Performs statistical and visual analyses on vulture population data.

**Main analyses included:**
1. **Population Dynamics Plot** – Overall population trend across regions and time.  
2. **Region × Period Boxplot** – Comparison of population distributions between regions and temporal periods.  
3. **SA vs SEA Counts Over Time** – Comparative trends between South and Southeast Asia.  
4. **ANOVA Table** – Statistical test comparing population means among regions.

**Software Requirements:**
- R (version ≥ 4.0)
- Packages: `ggplot2`, `dplyr`, `readr`, `tidyr`, `stats`

**Example usage:**
```r
# Run the script
source("Scripts/Population_Dynamics_Analysis.R")
```

---

## 3. Results

The results of the analysis include both visual and statistical outputs.

| Output | Description |
|---------|-------------|
| `Population_Dynamics_Plot.png` | Visualization of temporal population trends. |
| `Region_Period_Boxplot.png` | Distribution of observed populations across regions and periods. |
| `SA_SEA_Counts_Over_Time.png` | Comparison between South and Southeast Asian populations. |
| `ANOVA_Table.csv` | ANOVA summary table showing statistical differences among groups. |

---

## License

This project is distributed under the **MIT License**, which allows for free use, modification, and distribution with appropriate attribution.

---

## Author & Date

**Chanatip Ummee**  
Faculty of Veterinary Medicine, Kasetsart University  
Bangkok, Thailand  
[chanatip.umm@ku.th]
---

*Last updated: October 2025*

---
