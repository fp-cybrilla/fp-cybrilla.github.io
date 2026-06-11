---
title: Product Roadmap
---
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  :root {
    --bg: #ffffff;
    --border: #e5e7eb;
    --border-strong: #d1d5db;
    --text: #111827;
    --text-secondary: #374151;
    --muted: #6b7280;
    --accent: #2563eb;
  }
  .rm-wrap { font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif; font-size: 14px; line-height: 1.6; }
  .rm-title { font-size: 28px; font-weight: 700; color: var(--text); letter-spacing: -0.02em; margin-bottom: 24px; padding-bottom: 24px; border-bottom: 1px solid var(--border); }

  .month-block { border-top: 2px solid var(--text); padding: 20px 0 28px; }
  .month-block:last-child { border-bottom: 2px solid var(--text); }
  .month-layout { display: grid; grid-template-columns: 120px 1fr; gap: 0; }
  .month-label { font-size: 15px; font-weight: 700; color: var(--text); padding-top: 4px; }

  .feature-list { display: flex; flex-direction: column; gap: 10px; }

  .feature-card { border: 1px solid var(--border); border-radius: 10px; overflow: hidden; background: #fff; transition: box-shadow 0.15s; }
  .feature-card:hover { box-shadow: 0 2px 8px rgba(0,0,0,0.07); }

  .feature-btn { display: flex; align-items: flex-start; justify-content: space-between; gap: 12px; width: 100%; background: none; border: none; cursor: pointer; padding: 14px 16px; text-align: left; font-family: inherit; }
  .feature-btn-left { display: flex; flex-direction: column; gap: 7px; flex: 1; min-width: 0; }
  .feature-name { font-size: 14px; font-weight: 500; color: var(--text-secondary); line-height: 1.45; }

  .tag { display: inline-block; font-size: 11px; font-weight: 500; padding: 2px 9px; border-radius: 20px; white-space: nowrap; align-self: flex-start; }
  .tag-reach      { background: #EEEDFE; color: #3C3489; }
  .tag-sip        { background: #E1F5EE; color: #085041; }
  .tag-liquidity  { background: #FAEEDA; color: #633806; }
  .tag-portfolio  { background: #E6F1FB; color: #0C447C; }
  .tag-regulatory { background: #FAECE7; color: #712B13; }

  .chevron-btn { flex-shrink: 0; width: 30px; height: 30px; border: 1px solid var(--border); border-radius: 6px; background: #fff; display: flex; align-items: center; justify-content: center; cursor: pointer; margin-top: 2px; transition: background 0.1s; }
  .chevron-btn:hover { background: #f3f4f6; }
  .chevron-icon { color: var(--muted); transition: transform 0.2s; }
  .feature-card.open .chevron-icon { transform: rotate(180deg); color: var(--accent); }

  .detail-panel { display: none; font-size: 13px; color: var(--muted); line-height: 1.65; padding: 0 16px 16px 16px; border-top: 1px solid #f3f4f6; }
  .detail-panel.open { display: block; padding-top: 12px; }
  .detail-placeholder { color: #d1d5db; font-style: italic; }
</style>

<script>
const TAG = {
  reach:      { label: "Distributor reach & acquisition", cls: "tag-reach" },
  sip:        { label: "SIP continuity & flexibility",    cls: "tag-sip" },
  liquidity:  { label: "Instant liquidity access",        cls: "tag-liquidity" },
  portfolio:  { label: "Advanced portfolio management",   cls: "tag-portfolio" },
  regulatory: { label: "Regulatory changes",              cls: "tag-regulatory" },
};

const MONTHS = [
  {
    month: "June 2026",
    features: [
      { name: "Purchases and SIPs against external folios",        tag: "reach",     detail: "Place lump-sum purchases and set up SIPs on folios created outside FP-ONDC, regardless of which distributor created them." },
      { name: "Change of mandate against existing SIP",             tag: "sip",       detail: "A new SIP does not have to be created in case an investor cancels a mandate or wants to increase SIP amount." },
      { name: "SWP and STP activation and cancellation by amount",  tag: "portfolio", detail: "Activate or cancel SWPs and STPs by amount for monthly and daily frequencies." },
      { name: "UTI universal instant redemption",                   tag: "liquidity", detail: "Offer UTI instant redemptions to investors without a separate individual tie-up with UTI." },
    ]
  },
  {
    month: "July 2026",
    features: [
      { name: "Redemption and switch against external folios",            tag: "reach",     detail: "Place redemption and switch orders on folios created outside FP-ONDC, regardless of which distributor created them." },
      { name: "Purchase, redemption, and switch for AOS folios",          tag: "reach",     detail: "Create and transact on Anyone or Survivor (AOS) folios for investors." },
      { name: "Universal instant redemption (AMC to be announced later)", tag: "liquidity", detail: "Offer instant redemptions to investors without a separate individual tie-up with the chosen AMC." },
    ]
  },
  {
    month: "August 2026",
    features: [
      { name: "Weekly SIP",                                               tag: "sip",        detail: "Debit SIP instalments on a chosen day each week." },
      { name: "Regulatory changes related to nominations",                tag: "regulatory", detail: "RTAs yet to provide details" },
      { name: "Universal instant redemption (AMC to be announced later)", tag: "liquidity",  detail: "Offer instant redemptions to investors without a separate individual tie-up with the chosen AMC." },
    ]
  },
  {
    month: "October 2026",
    features: [
      { name: "Purchase and redemption for different investor types (one investor type (e.g., corporates, minors, etc.) with high market demand will be prioritised and delivered in October)", tag: "reach", detail: "Place transactions for a new investor type (e.g., corporates, minors, etc.)" },
    ]
  },
];

document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("rm-body");
  let idCounter = 0;

  MONTHS.forEach(({ month, features }) => {
    const block = document.createElement("div");
    block.className = "month-block";

    const layout = document.createElement("div");
    layout.className = "month-layout";

    const label = document.createElement("div");
    label.className = "month-label";
    label.textContent = month;

    const list = document.createElement("div");
    list.className = "feature-list";

    features.forEach(({ name, tag, detail }) => {
      const id = "d" + (idCounter++);
      const t = TAG[tag];
      const hasDetail = detail && detail.trim().length > 0;

      const card = document.createElement("div");
      card.className = "feature-card";

      const btn = document.createElement("button");
      btn.className = "feature-btn";
      btn.setAttribute("aria-expanded", "false");
      btn.setAttribute("aria-controls", id);
      btn.innerHTML = `
        <div class="feature-btn-left">
          <span class="feature-name">${name}</span>
          <span class="tag ${t.cls}">${t.label}</span>
        </div>
        <div class="chevron-btn" aria-hidden="true">
          <svg class="chevron-icon" width="14" height="14" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="4 6 8 10 12 6"/></svg>
        </div>
      `;

      const panel = document.createElement("div");
      panel.className = "detail-panel";
      panel.id = id;
      panel.innerHTML = hasDetail
        ? detail
        : `<span class="detail-placeholder">Detail coming soon.</span>`;

      btn.addEventListener("click", () => {
        const open = !card.classList.contains("open");
        card.classList.toggle("open", open);
        panel.classList.toggle("open", open);
        btn.setAttribute("aria-expanded", String(open));
      });

      card.appendChild(btn);
      card.appendChild(panel);
      list.appendChild(card);
    });

    layout.appendChild(label);
    layout.appendChild(list);
    block.appendChild(layout);
    container.appendChild(block);
  });
});
</script>

<div class="rm-wrap">
  <div class="rm-title">Product Roadmap</div>
  <div id="rm-body"></div>
</div>