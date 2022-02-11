const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.writeAll(source);

    try stdout.writeAll("\n\nconst source =\n");
    var iter = std.mem.split(u8, source, "\n");
    while (iter.next()) |line| {
        try stdout.print("    \\\\{s}\n", .{line});
    }
    try stdout.writeAll(";\n");
}

const source =
    \\const std = @import("std");
    \\
    \\pub fn main() !void {
    \\    const stdout = std.io.getStdOut().writer();
    \\    try stdout.writeAll(source);
    \\
    \\    try stdout.writeAll("\n\nconst source =\n");
    \\    var iter = std.mem.split(u8, source, "\n");
    \\    while (iter.next()) |line| {
    \\        try stdout.print("    \\\\{s}\n", .{line});
    \\    }
    \\    try stdout.writeAll(";\n");
    \\}
;
