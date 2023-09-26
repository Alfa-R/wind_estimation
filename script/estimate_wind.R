# The script requires a single command line argument, which is the file with the
# input data. It needs to be a .csv file with columns "time", "direction",
# "speed", and "ti" (which stands for turbulence intensity) in any order.
# If there are other columns, they will be ignored. The script will
# then estimate the parameters of a tri-variate Ornstein-Uhlenbeck process with
# the components [log ti, log speed, direction]. The logarithmic transformation
# is required because both the speed and turbulence intensity cannot be
# negative. The coefficients of the estimated process are saved into
# '../outputs/wind_MVOU_process.yml'

# Read the command line arguments and ensure that there is at least one
args<-commandArgs(TRUE)
if(length(args) < 1) { print("Provide the input path"); quit("no") }

# Read the .csv file
df <- read.csv(
  args[1],
  colClasses=c("character", rep("numeric", 5))
  )

# Find the first line with missing data and remove the data after it
blanks <- which(is.na(df), arr.ind=TRUE)[,"row"]
T <- if(length(blanks) < 1) dim(df)[1] else min(blanks) - 1
df <- df[1:T,]

# Parse the date format to determine the time increments (in seconds)
df$time <- as.POSIXct(df$time, tz="GMT", "%Y-%m-%dT%H:%M:%OSZ")
dt <- as.numeric(df$time[2] - df$time[1]) * 60

# Take a logarithmic transformation of the speed and ti
df$log_speed <- log(df$speed)
df$log_ti <- log(df$ti)

# Convert the input data to a matrix
dm <- data.matrix(df[,c("log_ti", "log_speed", "direction")])

# Run the estimation
source("fit_Ornstein_Uhlenbeck.R")
fit <- FitOrnsteinUhlenbeck(dm,dt)

# Save the results
library(yaml)
write_yaml(
  list(
    names=rownames(fit$Mu),
    mean=fit$Mu,
    drift=fit$Theta,
    diffusion=chol(fit$Sigma)
    ),
  '../data/outputs/wind_MVOU_process.yml'
  )
