if(!nzchar(Sys.getenv("RODBC_TESTING"))) q("no")

runone <- function(f)
{
    message("  Running ", sQuote(f))
    infile <- paste(f, "RR", sep = ".")
    outfile <- paste(f, "Rout", sep = ".")
    cmd <- paste(shQuote(file.path(R.home("bin"), "R")),
                 "CMD BATCH --vanilla",
                 shQuote(infile), shQuote(outfile))
    res <- system(cmd)
    if (res) {
        cat(readLines(outfile), sep="\n")
        file.rename(outfile, paste(outfile, "fail", sep="."))
        return(1L)
    }
    savefile <- paste(outfile, "save", sep = "." )
    if (file.exists(savefile)) {
        message("  Comparing ", sQuote(outfile), " to ",
                sQuote(savefile), " ...", appendLF = FALSE)
        res <- tools:::Rdiff(outfile, savefile, TRUE)
        if (!res) message(" OK")
    }
    0L
}

res = runone("C:\\Personal\\R\\RODBC_1.3-16\\RODBC\\tests\\DB2")

proc.time()

if(res) stop(gettextf("%d tests failed", res))
