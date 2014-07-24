#Canvas for Exploring mtcars dataset
data(mtcars)

fit <- lm(mpg ~ factor(am) + factor(cyl) + disp + hp + drat + wt + qsec + gear + carb, mtcars)
fit <- lm(mpg ~ factor(am) + disp + hp + drat + wt + qsec + gear + carb, mtcars)
fit <- lm(mpg ~ factor(am) + disp + hp + drat + wt + qsec + gear, mtcars)
fit <- lm(mpg ~ factor(am) + disp + hp + drat + wt + qsec, mtcars)
fit <- lm(mpg ~ factor(am) + disp + hp + wt + qsec, mtcars)
fit <- lm(mpg ~ factor(am) + hp + wt + qsec, mtcars)
fit <- lm(mpg ~ factor(am) + wt + qsec, mtcars)
with(mtcars, plot(factor(ifelse(am, "manual", "automatic")), resid(fit), main = "MPG vs transmission residuals"))
par("mfrow" = c(1,3))
with(mtcars, plot(factor(ifelse(am, "manual", "automatic")), mpg, main = "MPG Distribution"))
with(mtcars, plot(wt / 2, mpg, col=ifelse(am, "red", "green"), main = "MPG values by vehicle weight", 
                  xlab = "weight in U.S. short tons"))
legend("topright", col=c("red","green"), pch = 1, legend = c("manual", "automatic"), title = "transmission")
with(mtcars, plot(hp, mpg, col=ifelse(am, "red", "green"), main = "MPG values by vehicle weight", 
                  xlab = "weight in U.S. short tons"))
legend("topright", col=c("red","green"), pch = 1, legend = c("manual", "automatic"), title = "transmission")
print(summary(fit)$coef)
print(summary(fit))
fit <- lm(mpg ~ factor(am) + disp + hp + drat + wt + qsec + gear + carb, mtcars)
fit <- lm(mpg ~ factor(am) + disp + hp + drat + wt + qsec + gear + carb, mtcars)

panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}

pairs(mtcars, lower.panel = panel.smooth, upper.panel = panel.cor)
