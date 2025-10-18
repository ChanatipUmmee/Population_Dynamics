# Population Dynamics Data

This dataset (`Population_Dynamics_Data.csv`) contains population data used in the **Population Dynamics Analysis** project.

## File Description

**File name:** `Population_Dynamics_Data.csv`  
**Format:** CSV (Comma-Separated Values)  
**Total columns:** 5  
**Total rows:** 76

| Column Name | Description |
|--------------|-------------|
| `Country` | The country where the observation was recorded (e.g., Tibet, Nepal, Thailand). |
| `Area` | Indicates whether the site is a *Breeding* or *Non-breeding* area. |
| `Region` | The geographic region, such as *Qinghai–Tibet Plateau*, *South Asia*, or *Southeast Asia*. |
| `Year` | The year in which the observation was made. |
| `No` | The number of individuals observed (count or estimate). |

## Data Coverage

| Region | Countries Included |
|---------|--------------------|
| Qinghai–Tibet Plateau | Tibet |
| South Asia | Nepal, Pakistan |
| Southeast Asia | Myanmar, Thailand, Cambodia, Malaysia, Singapore, Indonesia |

## Usage

This dataset is used for:  
- Population trend visualization  
- Regional comparisons across years  
- ANOVA tests on population differences between regions and periods  

## Example in R

```r
# Load the dataset
data <- read.csv("Population_Dynamics_Data.csv")

# Summarize by region
summary <- aggregate(No ~ Region, data = data, FUN = mean)
print(summary)
```

## License

This dataset is shared under the **MIT License**, allowing use, modification, and distribution with proper attribution.

---

**Chanatip Ummee**  
Faculty of Veterinary Medicine, Kasetsart University  
Bangkok, Thailand  
[chanatip.umm@ku.th]
---

*Last updated: October 2025*
