## install devtools package if it's not already
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

## install dev version of hexagon from github
devtools::install_github("mkearney/hexagon")

## load rtweet package
library(hexagon)

## create hexagon xy data frame using argument defaults
hex1 <- hexdf()

## plot outline of hexagon
with(hex1, plot(x, y, type = "l"))

## create larger hexagon to the lower right with a different midpoint
hex2 <- hexdf(2, mid = c(2.5, -2))

## load ggplot2
library(ggplot2)

## plot both hex1 and hex2 objects using ggplot2
ggplot(hex1, aes(x, y)) +
  geom_polygon(fill = "blue") +
  geom_polygon(data = hex2, fill = "red")



## generate some data to plot
n <- 43
den <- ceiling(n / 5)
x <- seq(-.525, .465, length.out = n) + rep(c(-.005, .005), ceiling(n/2))[1:n]
y <- seq(-.1, .1, length.out = ceiling(n / den))
y <- rep(c(y, rev(y)), ceiling(n / den))[1:n] + seq(.0, .45, length.out = n)
z <- c(rep("a", ceiling(n / den)), rep("b", ceiling(n / den)))
z <- rep(z, ceiling(n / den))[1:n]
pts <- data.frame(x, y, z)

## create base plot
p_ <- ggplot(hex1, aes(x, y)) +
  geom_polygon(fill = "#114466", colour = "#001030", size = 1) +
  geom_point(data = pts, aes(fill = z, colour = z), shape = 21, size = 1.75) +
  scale_fill_manual(values = c("#8CFF00", "#cc00ff")) +
  scale_colour_manual(values = c("#0A2200", "#110033")) +
  annotate("text", 0, -.36, label = "hexagon",
           colour = "white", size = 8, fontface = "bold") +
  coord_fixed(ratio = 1, expand = TRUE) +
  coord_cartesian(xlim = range(hex1$x), ylim = range(hex1$y)) +
  theme_void()

## adjust margin to maximize sticker
t <- 6
r <- 5
b <- 9
l <- 8
p <- p_ +
  theme(legend.position = "none",
        plot.margin = margin(-t, -r, -b, -l, unit = "pt"))

#view plot in device
p

## save plot with sticker dimensions
#ggsave("hexagon-logo.png", p, width = 1.73, height = 2,
#  units = "in", bg = "transparent")


hexdf <- function(size = 1, mid = c(0, 0), angle = 90) {
  width <- size * 1
  height <- size * 0.865
  xy <- shape:::getellipse(width, height, mid = mid, dr = 2 * pi/6)
  tibble::as_tibble(structure(as.data.frame(shape::rotatexy(xy, angle = angle, mid = mid)),
                              class = "data.frame", names = c("x", "y")), validate = FALSE)
}
hexdf


#' @export
theme_hexagon <- function(hexdata) {
  if (!requireNamespace("ggplot2", quietly = FALSE)) {
    stop("must install ggplot2 pkg", call. = FALSE)
  }
  t <- 6
  r <- 5
  b <- 9
  l <- 8
  ggplot2::theme_void() +
    #    ggplot2::coord_fixed(ratio = 1, expand = TRUE) +
    #    ggplot2::coord_cartesian(xlim = range(hexdata$x), ylim = range(hexdata)) +
    ggplot2::theme(legend.position = "none",
                   plot.margin = ggplot2::margin(-t, -r, -b, -l, unit = "pt"))
}
