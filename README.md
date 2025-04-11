@RestController
public class SqlLintController {

    @PostMapping("/lint")
    public ResponseEntity<String> lintSql(@RequestParam("sqlScript") String sqlScript) {
        try {
            // Save script to temp file
            File tempSql = File.createTempFile("script", ".sql");
            Files.write(tempSql.toPath(), sqlScript.getBytes());

            // Run SQLFluff command
            ProcessBuilder pb = new ProcessBuilder("sqlfluff", "lint", tempSql.getAbsolutePath());
            pb.redirectErrorStream(true);
            Process process = pb.start();

            // Read output
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String output = reader.lines().collect(Collectors.joining("\n"));
            process.waitFor();
            tempSql.delete();  // Clean up

            return ResponseEntity.ok(output);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("Linting failed: " + e.getMessage());
        }
    }
}
