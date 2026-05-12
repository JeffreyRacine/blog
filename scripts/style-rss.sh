#!/usr/bin/env bash
set -euo pipefail

out_dir="docs"
rss_file="${out_dir}/index.xml"
xsl_src="rss.xsl"
xsl_out="${out_dir}/rss.xsl"
pi='<?xml-stylesheet type="text/xsl" href="rss.xsl"?>'

if [[ ! -f "${rss_file}" ]]; then
  echo "RSS feed not found: ${rss_file}" >&2
  exit 1
fi

if [[ ! -f "${xsl_src}" ]]; then
  echo "RSS stylesheet source not found: ${xsl_src}" >&2
  exit 1
fi

cp "${xsl_src}" "${xsl_out}"

if grep -q 'xml-stylesheet.*rss.xsl' "${rss_file}"; then
  exit 0
fi

tmp_file="${rss_file}.tmp.$$"
awk -v pi="${pi}" '
  NR == 1 && $0 ~ /^<\?xml/ { print; print pi; next }
  NR == 1 { print pi; print; next }
  { print }
' "${rss_file}" > "${tmp_file}"
mv "${tmp_file}" "${rss_file}"
